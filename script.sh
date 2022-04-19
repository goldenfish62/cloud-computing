#!/bin/bash 

# test mode: CPU 
counter=1 
while [ $counter -le 5 ] 
    do 
        #sysbench --num-threads=2 --test=cpu --cpu-max-prime=100000000 run 
        #sysbench --num-threads=4 --test=cpu --cpu-max-prime=100000000 run 
        #sysbench --num-threads=8 --test=cpu --cpu-max-prime=100000000 run 
        ((counter++)) 
    done 
echo CPU All done 

# test mode: fileio-seqrd 
counter=1 
while [ $counter -le 5 ] 
    do 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd prepare 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd run 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrd prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrd run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrd prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrd run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-seqrd All done

# test mode: fileio-seqwr
counter=1 
while [ $counter -le 5 ] 
    do 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqwr prepare 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqwr run 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqwr prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqwr run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqwr prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqwr run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-seqwr All done

# test mode: fileio-seqrewr
counter=1 
while [ $counter -le 5 ] 
    do 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrewr prepare 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrewr run 
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrewr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrewr prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrewr run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=seqrewr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrewr prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrewr run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=seqrewr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-seqrewr All done

# test mode: fileio-rndrd
counter=1
while [ $counter -le 5 ]
    do
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrd prepare
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrd run
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrd prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrd run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrd prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrd run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrd cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-rndrd All done

# test mode: fileio-rndwr
counter=1
while [ $counter -le 5 ]
    do
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndwr prepare
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndwr run
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndwr prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndwr run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndwr prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndwr run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndwr cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-rndwr All done

# test mode: fileio-rndrw
counter=1
while [ $counter -le 5 ]
    do
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrw prepare
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrw run
        sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=rndrw cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrw prepare
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrw run
        sysbench --num-threads=4 --test=fileio --file-total-size=2G --file-test-mode=rndrw cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrw prepare
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrw run
        sysbench --num-threads=8 --test=fileio --file-total-size=2G --file-test-mode=rndrw cleanup
        echo 3 | sudo tee /proc/sys/vm/drop_caches
        ((counter++))
    done
echo fileio-rndrw All done




