# 🚗 car_rans - RANS Case

![RANS](https://img.shields.io/badge/Model-kOmegaSST-2E86C1?style=flat-square)
![Solver](https://img.shields.io/badge/Solver-simpleFoam-117A65?style=flat-square)
![OpenFOAM](https://img.shields.io/badge/OpenFOAM-12-5D6D7E?style=flat-square)

Case-specific notes for the RANS setup.  
General workflow (mesh/run/parallel) is documented in the repository root `README.md`.

## Setup Details

- OpenFOAM version: 12
- Preferred run command: `simpleFoam`
- Simulation type: RAS
- Turbulence model: `kOmegaSST`
- Parameter update script (run inside this folder): `./updateCaseParams.sh`

> [!NOTE]
> If you change geometry scale, update `scale` in `updateCaseParams.sh` and run the script again to recalculate case parameters.
