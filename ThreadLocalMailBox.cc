/**
 * compile: c++ ThreadLocalMailBox.cc -lpthread
 *
 * Wraps around a variable so it can act as a thread local variable.
 *
 */
#include <iostream>
#include <typeinfo>
#include <map>
#include <thread>
#include <mutex>
using namespace std;

class ThreadLocalMailBox {
	public:
		ThreadLocalMailBox() = default;
		~ThreadLocalMailBox() {
			for (auto& mail : message_) {
				cout << mail.first << '=' << mail.second << endl;
			}
		}

		int get() const {
			map<thread::id, int>::const_iterator itr;
			thread::id id = this_thread::get_id();
			{
				unique_lock<mutex> lock;
				if ((itr = message_.find(id)) == message_.end()) {
					return 0; // Maybe throw?
				} else {
					return itr->second;
				}
			}

			
		}

		bool isSatisfied() const {
			map<thread::id, int>::const_iterator itr;
			thread::id id = this_thread::get_id();
			unique_lock<mutex> lock;
			if ((itr = message_.find(id)) == message_.end()) {
				return false;
			} else {
				return true;
			}

		}

		void set(int i) {
			thread::id id = this_thread::get_id();
			unique_lock<mutex> lock;
			message_[id] = i;
		}

	private:
		map<thread::id, int> message_;
		mutex mutex_;
};


void foo(ThreadLocalMailBox* box) {
	box->set(1);
}

int main() {
	ThreadLocalMailBox mailbox;

	thread t1(foo, &mailbox);
	thread t2(foo, &mailbox);

	t1.join();
	t2.join();
}


