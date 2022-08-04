BUILD_ROOT := $(src)

obj-m += macho_loader.o

macho_loader-objs := ./src/binfmt.o 

EXTRA_CFLAGS=-I$(PWD)/include

all:
	 $(MAKE) -C /lib/modules/$(shell uname -r)/build $(MAKE_OPTS) M=$(PWD) modules

clean:
	 $(MAKE) -C /lib/modules/$(shell uname -r)/build $(MAKE_OPTS) M=$(PWD) clean

module_install:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build $(MAKE_OPTS) M=$(PWD) modules_install
