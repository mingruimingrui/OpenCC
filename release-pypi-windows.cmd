@echo off
setlocal EnableDelayedExpansion

SET VERSIONS=2.7 3.5 3.6 3.7 3.8
SET SOURCEDIR=%cd%

REM Build packages
for %%v in (%VERSIONS%) do (
    SET ENV_NAME=py%%v

    REM Create and activate environment
    cd %ROOT_DIR%
<<<<<<< HEAD
    CALL conda create -y -n py%%v python=%%v
    if !ERRORLEVEL! NEQ 0 (EXIT !ERRORLEVEL!)
    CALL conda activate py%%v
=======
    CALL C:\Miniconda/condabin/conda.bat create -y -n py%%v python=%%v
    if !ERRORLEVEL! NEQ 0 (EXIT !ERRORLEVEL!)
    CALL C:\Miniconda/condabin/conda.bat activate py%%v
>>>>>>> upstream/master
    if !ERRORLEVEL! NEQ 0 (EXIT !ERRORLEVEL!)
    pip install --no-cache-dir setuptools wheel pytest
    if !ERRORLEVEL! NEQ 0 (EXIT !ERRORLEVEL!)

    REM Build and package
    python setup.py build_ext bdist_wheel
    if !ERRORLEVEL! NEQ 0 (EXIT !ERRORLEVEL!)

    REM Cleanup
<<<<<<< HEAD
    CALL conda deactivate
=======
    CALL C:\Miniconda/condabin/conda.bat deactivate
>>>>>>> upstream/master
    rmdir /S /Q build python\opencc\clib OpenCC.egg-info
)

REM Upload to PyPI
<<<<<<< HEAD
REM conda activate py3.8
REM python -m pip install twine
REM python -m twine upload dist/*
=======
C:\Miniconda/condabin/conda.bat activate py3.8
python -m pip install twine
python -m twine upload dist/*
>>>>>>> upstream/master
