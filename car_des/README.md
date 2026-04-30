# 🚗 car_des - DES Case

![DES](https://img.shields.io/badge/Model-kOmegaSSTDES-2E86C1?style=flat-square)
![Solver](https://img.shields.io/badge/Solver-pimpleFoam-117A65?style=flat-square)
![OpenFOAM](https://img.shields.io/badge/OpenFOAM-12-5D6D7E?style=flat-square)

Case-specific notes for the DES setup.  
General workflow (mesh/run/parallel) is documented in the repository root `README.md`.

## Setup Details

- OpenFOAM version: 12
- Preferred run command: `pimpleFoam`
- Turbulence setup: DES (`kOmegaSSTDES`)
- Parameter update script (run inside this folder): `./updateCaseParams.sh`

## Example Results

The GIFs below are example outputs showing how `car_des` behaves.

> [!NOTE]
> These results are based on geometry with `scale=0.001`.
> If needed, convert geometry scale with `surfaceConvert`.

> [!IMPORTANT]
> If you change geometry scale, update `scale` in `updateCaseParams.sh` and run the script again to recalculate case parameters.

Velocity (`U`)
![](../docs/animations/u_des.gif)

Pressure (`p`)
![](../docs/animations/p_des.gif)

Turbulence Kinetic Energy (`k`)
![](../docs/animations/k_des.gif)

Turbulent Viscosity (`nut`)
![](../docs/animations/nut_des.gif)