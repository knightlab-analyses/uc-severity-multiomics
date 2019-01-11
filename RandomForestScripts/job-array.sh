# Walltime Limit: hh:nn:ss
#PBS -l walltime=120:00:00

# Node and memory specs
#PBS -l nodes=1:ppn=4 -l pmem=16gb

# Mail: options are (a) aborted, (b) begins execution, (e) ends execution
#PBS -M rmills198@gmail.com
#PBS -m abe

# Job name:
#PBS -N RndmForests

#Job array
#PBS -t 1-100%10

######################################################################

# Executable commands go here. Make sure that mpirun -np and -npn match the
# number of processors you requested from PBS! If you are using ppn and want
# npn=2, then you can leave -np and -npn off and PBS will add it for you. If
# you want npn=1, then you have to request all of the processors on all of the
# nodes, and then force it to use less using -npn.

echo ------------------------------------------------------
echo PBS: qsub is running on $PBS_O_HOST
echo PBS: originating queue is $PBS_O_QUEUE
echo PBS: executing queue is $PBS_QUEUE
echo PBS: working directory is $PBS_O_WORKDIR
echo PBS: execution mode is $PBS_ENVIRONMENT
echo PBS: job identifier is $PBS_JOBID
echo PBS: job name is $PBS_JOBNAME
echo PBS: node file is $PBS_NODEFILE
echo PBS: current home directory is $PBS_O_HOME
echo PBS: PATH = $PBS_O_PATH
echo ------------------------------------------------------

source activate qiime2-2018.11

base_dir=/home/rhmills/UC_Severity/Random_Forests2/

qiime sample-classifier regress-samples \
--i-table /home/rhmills/UC_Severity/Allfeatures.qza \
--m-metadata-file /home/rhmills/UC_Severity/UC_MP_Emperor_Map.txt \
--m-metadata-column partial_mayo \
--p-n-jobs 4 \
--p-optimize-feature-selection \
--p-parameter-tuning \
--p-estimator RandomForestRegressor \
--p-test-size 0.1 \
--output-dir ${base_dir}/${PBS_ARRAYID}
