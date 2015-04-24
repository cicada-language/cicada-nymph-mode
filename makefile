.ONESHELL:

help:
	@
	echo -e " \e[33;1m                                                           \e[0m "
	echo -e " \e[33;1m   makefile functions                                      \e[0m "
	echo -e " \e[33;1m     clean                                                 \e[0m "
	echo -e " \e[33;1m							     \e[0m "
	echo -e " \e[33;1m                                                           \e[0m "
	echo -e " \e[33;1m   please read the makefile for more informations          \e[0m "
	echo -e " \e[33;1m							     \e[0m "
	echo -e " \e[33;1m   i wish you happy making ^_^                             \e[0m "
	echo -e " \E[33;1m                                                           \E[0m "

clean*~:
	rm -f *~ */*~ */*/*~ */*/*/*~ */*/*/*/*~  */*/*/*/*/*~  

clean:
	make clean*~                                  &&\
	echo -e "\E[33;1m [ok] clean directory \E[0m"
