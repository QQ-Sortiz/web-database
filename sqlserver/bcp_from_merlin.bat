bcp "select UniversalDataID, count(*) from AllocationResult group by UniversalDataID" queryout allocation_result_distribution.dat -c -a 65535 -S merlin.seaaroundus.org -d Merlin -U sau_merlin -P P4tF7KuQz4  -k