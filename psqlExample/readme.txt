fpc testpg1.pp -Fl/opt/PostgreSQL/10/lib
fpc testpg2.pp -Fl/opt/PostgreSQL/10/lib
fpc -Fl$PGLIBDIR testpg1.pp
fpc -Fl/opt/PostgreSQL/10/lib testpg1.pp  
