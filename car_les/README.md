# 🚗 car_les - LES Case

![LES](https://img.shields.io/badge/Model-WALE-2E86C1?style=flat-square)
![Solver](https://img.shields.io/badge/Solver-pimpleFoam-117A65?style=flat-square)
![OpenFOAM](https://img.shields.io/badge/OpenFOAM-12-5D6D7E?style=flat-square)

Case-specific notes for the LES setup.  
General workflow (mesh/run/parallel) is documented in the repository root `README.md`.

## Setup Details

- OpenFOAM version: 12
- Preferred run command: `pimpleFoam`
- Simulation type: LES
- Turbulence model: `WALE`
- Parameter update script (run inside this folder): `./updateCaseParams.sh`

## Example Results

The GIFs below are example outputs showing how `car_les` behaves.

> [!NOTE]
> These results are based on geometry with `scale=0.001`.
> If needed, convert geometry scale with `surfaceConvert`.

> [!IMPORTANT]
> If you change geometry scale, update `scale` in `updateCaseParams.sh` and run the script again to recalculate case parameters.

<p align="center"><strong>Velocity (<code>U</code>)</strong></p>
<p align="center">
  <img src="../docs/animations/u_les.gif" alt="Velocity U" width="900">
</p>

<p align="center"><strong>Pressure (<code>p</code>)</strong></p>
<p align="center">
  <img src="../docs/animations/p_les.gif" alt="Pressure p" width="900">
</p>
