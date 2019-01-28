

- https://docs.aws.amazon.com/cli/latest/userguide/installing.html
- https://github.com/cvdfoundation/open-images-dataset#download-full-dataset-with-google-storage-transfer


# Performance

## Random writes
```shell
fio --name=randwrite --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=512M --numjobs=2 --runtime=240 --group_reporting
```

## Random Write Read
```
fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75
```

https://github.com/meganerd/fio-examples/blob/master/fio-8k/random-write-test-buf.fio