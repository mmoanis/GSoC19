pushd .
cd /usr/local/bin
source geant4.sh
source thisroot.sh
popd


# Backward compitability between Geant4 10.3 and Geant4 10.5
export G4NEUTRONXSDATA=$G4PARTICLEXSDATA
