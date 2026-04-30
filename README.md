# OpenFOAM Car Aerodynamics

![OpenFOAM 12](https://img.shields.io/badge/OpenFOAM-12-0B3D91?style=for-the-badge)
![CFD](https://img.shields.io/badge/CFD-External_Aerodynamics-1E8449?style=for-the-badge)

This repository contains three external car aerodynamics cases:

- `car_rans` - steady RANS setup
- `car_des` - DES setup
- `car_les` - LES setup

## Requirements

- OpenFOAM 12
- STL geometry in each case: `constant/triSurface/Car.stl`

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
surfaceFeatureExtract
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

### Solver Run

```bash
decomposePar

# car_des / car_les
mpirun -np 16 pimpleFoam -parallel

# car_rans
mpirun -np 16 simpleFoam -parallel

reconstructPar
```

### Parallel Meshing

```bash
decomposePar
mpirun -np 16 snappyHexMesh -parallel -overwrite
reconstructParMesh -constant
checkMesh
```

## Notes

> [!TIP]
> `updateCaseParams.sh` is available in the repository root and copied into each case directory for local execution.

> [!NOTE]
> All GIF examples in this repository are based on geometry with `scale=0.001`.
> You can convert geometry scale with OpenFOAM `surfaceConvert`, for example:
> `surfaceConvert input.stl output.stl -scale 0.001`

> [!IMPORTANT]
> After changing geometry scale, update `scale` in `updateCaseParams.sh` and run the script again to recalculate consistent `Re`, `Aref`, `lRef`, and turbulence parameters.

> [!NOTE]
> Case-specific details are documented in local `README.md` files inside each case folder.
