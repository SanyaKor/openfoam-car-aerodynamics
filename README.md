# OpenFOAM Car Aerodynamics

![OpenFOAM 12](https://img.shields.io/badge/OpenFOAM-12-0B3D91?style=for-the-badge)
![CFD](https://img.shields.io/badge/CFD-External_Aerodynamics-1E8449?style=for-the-badge)

This repository contains three external car aerodynamics cases:

- `car_rans` - steady RANS setup
- `car_des` - DES setup
- `car_les` - LES setup

## Requirements

- OpenFOAM 12

## Quick Start (Any Case)

1) Enter a case directory:

```bash
cd car_des
# or: cd car_les
# or: cd car_rans
```

2) Update derived parameters:

`updateCaseParams.sh` is already present inside each case folder.  
If it is missing for any reason, copy it from the repository root:

```bash
cp ../updateCaseParams.sh .
chmod +x updateCaseParams.sh
```

```bash
./updateCaseParams.sh
```

3) Generate mesh:

```bash
blockMesh
snappyHexMesh -overwrite
checkMesh
```

4) Run solver:

```bash
# car_des / car_les
pimpleFoam

# car_rans
simpleFoam
```

## Parallel Run (Optional)

### Parallel Meshing

```bash
decomposePar
mpirun -np 16 snappyHexMesh -parallel -overwrite
reconstructPar
checkMesh
```

### Solver Run

```bash
cp 0/U.orig 0/U
potentialFoam
decomposePar

# car_des / car_les
mpirun -np 16 pimpleFoam -parallel

# car_rans
mpirun -np 16 simpleFoam -parallel

reconstructPar
```

## Logging

Save solver output to a log file:

```bash
# single-core run
simpleFoam &> log.simpleFoam
foamLog log.simpleFoam

# parallel run
mpirun -np 16 pimpleFoam -parallel &> log.pimpleFoam
foamLog log.pimpleFoam
```

## Notes

> [!TIP]
> `updateCaseParams.sh` is available in the repository root and copied into each case directory for local execution.

> [!NOTE]
> All GIF examples in this repository are based on geometry with `scale=0.001`.
> You can convert geometry scale with OpenFOAM `surfaceConvert`, for example:
> `surfaceConvert input.stl output.stl -scale 0.001`

> [!IMPORTANT]
> After changing geometry scale, update `scale` in `updateCaseParams.sh` and run the script again to recalculate consistent `magUInf`, `Aref`, `lRef`, and turbulence parameters.

> [!NOTE]
> Case-specific details are documented in local `README.md` files inside each case folder.
