CP2 = ~/src/cp2_1.0.5_osx-x64_sc/cp2
DISK = /Users/bazyar/src/gshd/HD4B.PO

extract: $(DISK)
	$(CP2) extract $(DISK) src:life.build

life.shk: $(DISK)
	$(CP2) create-file-archive life.shk
	$(CP2) copy $(DISK) src:life.build life.shk

life.po: $(DISK)
	$(CP2) create-disk-image life.po 800k ProDOS
	$(CP2) copy $(DISK) src:life.build life.po

clean:
	rm life.shk
	rm -r life.build

all: extract life.shk
