# GSoC19
My GSoC19 with CERN-HSF AllPix-Squared framework.

During the project, I have implemented the new feature of running the simulation events in parallel. This included:
- Bulding custom run managers for Geant4
- Refactoring Messenger implementation
- Refactoring Event class
- Making almost all modules thread safe
- Adding a buffering mechanism for writer modules

## Project Timeline
This is a weekly timeline of my GSoC19 project:
- Week 1 (12-19 May)
   * Setting up the development environment
   * Running initial benchmarks
   * Rebasing previous work
- Week 2 (20-26 May)
   * Studying Geant4 and Allpix codebases
   * Initial attempt for a custom run manager
- Week 3 (27 May-2 June):
   * Studying CMS custom run manager
   * Control seeding of my custom implementation
- Week 4 (3-9 June)
   * Added the custom manager to Allpix
   * Added new `finalizeThread()` method for modules to cleanup thread-local objects
   * Removed all special handling for Geant4
- Week 5 (10-16 June)
   * Debugging the case where Deposition module doesn't produce output with custom manager
- Week 6 (17-23 June)
   * Fixed the deposition module issues with the new custom manager
- Week 7 (24-30 June)
   * Testing the custom run manager
   * Submitted a merge request to write object ASCII representation used in  testing: https://gitlab.cern.ch/allpix-squared/allpix-squared/merge_requests/225
- Week 8 (1-7 July)
   * Investigating how to run the visualization module with the custom manager
- Week 9 (8-14 July)
   * Implemented another run manager for the case of no MT, to use same seeding mechanism.
   * Seperate sensitive detector and field construction in a special class to keep them in deposition module instead of having to move them to geometry construction module
   * LXPLUS disabled on CI
   * Created a different branch for testing with TextWriter module
- Week 10 (15-21 July)
   * Finalized both run managers implementation
   * Debugging with Heligring to catch any errors
   * Fix the case of using ION tables
   * Conduct testing plan to test both MT and non-MT run manager and make sure they produce same output given same seed
   * Refactored messenger and event classes
- Week 11 (22-28 July)
   * Running benchmarks with the custom managers
   * Identified the ROOT issue and identified the problamatic version
   * Using same ROOT as CI
   * Fixed various issues after running on CentOS instead of Ubuntu
- Week 12 (29 July - 4 August)
   * Fixed the slowdown on single core issue
   * Opened [merge request](https://gitlab.cern.ch/allpix-squared/allpix-squared/merge_requests/227)
   * Fixing code review issues
   * Implementing buffering for each specific module
- Week 13 (4-11 August)
   * Abandon iintial buffering approach
   * Fixing code review comments
   * Running benchmarks and tests
- Week 14 (12-18 August)
   * Updating documentation and user manual
   * Fixing code review comments
   * Running vTune profiler and analyzing performance, and hotspots
   * Running final benchmarks
- Week 15 (19- August)
   * Running final testing using MT On and Off
   * Fixed an issue with UI macros in the MT run manager
   
