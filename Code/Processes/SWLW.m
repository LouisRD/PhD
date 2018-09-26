clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030b.ES01.pop.h.LWDN_F.1900-01_cat_1909-12.nc LWDN_F
LWdb = LWDN_F;
ncload b30.030b.ES01.pop.h.LWDN_F.1910-01_cat_1919-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1920-01_cat_1929-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1930-01_cat_1939-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1940-01_cat_1949-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1950-01_cat_1959-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1960-01_cat_1969-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1970-01_cat_1979-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1980-01_cat_1989-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.030b.ES01.pop.h.LWDN_F.1990-01_cat_1999-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2000-01_cat_2009-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2010-01_cat_2019-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2020-01_cat_2029-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2030-01_cat_2039-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2040-01_cat_2049-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2050-01_cat_2059-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2060-01_cat_2069-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2070-01_cat_2079-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2080-01_cat_2089-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);
ncload b30.040b.ES01.pop.h.LWDN_F.2090-01_cat_2099-12.nc LWDN_F
LWdb = cat(1,LWdb,LWDN_F);

ncload b30.030b.ES01.pop.h.LWUP_F.1900-01_cat_1909-12.nc LWUP_F
LWub = LWUP_F;
ncload b30.030b.ES01.pop.h.LWUP_F.1910-01_cat_1919-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1920-01_cat_1929-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1930-01_cat_1939-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1940-01_cat_1949-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1950-01_cat_1959-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1960-01_cat_1969-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1970-01_cat_1979-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1980-01_cat_1989-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.030b.ES01.pop.h.LWUP_F.1990-01_cat_1999-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2000-01_cat_2009-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2010-01_cat_2019-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2020-01_cat_2029-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2030-01_cat_2039-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2040-01_cat_2049-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2050-01_cat_2059-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2060-01_cat_2069-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2070-01_cat_2079-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2080-01_cat_2089-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);
ncload b30.040b.ES01.pop.h.LWUP_F.2090-01_cat_2099-12.nc LWUP_F
LWub = cat(1,LWub,LWUP_F);

ncload b30.030b.ES01.pop.h.QSW_HTP.1900-01_cat_1909-12.nc QSW_HTP
SWb = QSW_HTP;
ncload b30.030b.ES01.pop.h.QSW_HTP.1910-01_cat_1919-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1920-01_cat_1929-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1930-01_cat_1939-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1940-01_cat_1949-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1950-01_cat_1959-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1960-01_cat_1969-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1970-01_cat_1979-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1980-01_cat_1989-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.030b.ES01.pop.h.QSW_HTP.1990-01_cat_1999-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2000-01_cat_2009-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2010-01_cat_2019-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2020-01_cat_2029-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2030-01_cat_2039-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2040-01_cat_2049-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2050-01_cat_2059-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2060-01_cat_2069-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2070-01_cat_2079-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2080-01_cat_2089-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);
ncload b30.040b.ES01.pop.h.QSW_HTP.2090-01_cat_2099-12.nc QSW_HTP
SWb = cat(1,SWb,QSW_HTP);


ncload b30.030c.pop.h.LWDN_F.1870-01_cat_1999-12.nc LWDN_F
LWdc = LWDN_F;
ncload b30.030c.pop.h.LWUP_F.1870-01_cat_1999-12.nc LWUP_F
LWuc = LWUP_F;
ncload b30.030c.pop.h.QSW_HTP.1870-01_cat_1999-12.nc QSW_HTP
SWc = QSW_HTP;

cd ocn-temp/
ncload b30.040c.pop.h.2000.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = LWDN_F;
LWuc40 = LWUP_F;
SWc40 = QSW_HTP;
[nlat nlong] = size(LWDN_F);
ncload b30.040c.pop.h.2001.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2002.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2003.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2004.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2005.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2006.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2007.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2008.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2009.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2010.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2011.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2012.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2013.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2014.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2015.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2016.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2017.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2018.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2019.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2020.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2021.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2022.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2023.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2024.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2025.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2026.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2027.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2028.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2029.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2030.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2031.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2032.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2033.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2034.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2035.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2036.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2037.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2038.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2039.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2040.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2041.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2042.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2043.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2044.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2045.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2046.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2047.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2048.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2049.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2050.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2051.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2052.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2053.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2054.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2055.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2056.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2057.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2058.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2059.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2060.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2061.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2062.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2063.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2064.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2065.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2066.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2067.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2068.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2069.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2070.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2071.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2072.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2073.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2074.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2075.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2076.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2077.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2078.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2079.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2080.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2081.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2082.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2083.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2084.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2085.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2086.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2087.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2088.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2089.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2090.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2091.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2092.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2093.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2094.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2095.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2096.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2097.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2098.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
ncload b30.040c.pop.h.2099.ann.nc LWDN_F LWUP_F QSW_HTP
LWdc40 = cat(1,LWdc40,LWDN_F);
LWuc40 = cat(1,LWuc40,LWUP_F);
SWc40 = cat(1,SWc40,QSW_HTP);
cd ..
LWdc40 = reshape(LWdc40,[100 nlat nlong]);
LWuc40 = reshape(LWuc40,[100 nlat nlong]);
SWc40 = reshape(SWc40,[100 nlat nlong]);

ncload b30.030e.pop.h.LWDN_F.1870-01_cat_1999-12.nc LWDN_F
LWde = LWDN_F;
ncload b30.040e.pop.h.LWDN_F.2000-01_cat_2099-12.nc LWDN_F
LWde = cat(1,LWde,LWDN_F);
ncload b30.030e.pop.h.LWUP_F.1870-01_cat_1999-12.nc LWUP_F
LWue = LWUP_F;
ncload b30.040e.pop.h.LWUP_F.2000-01_cat_2099-12.nc LWUP_F
LWue = cat(1,LWue,LWUP_F);
ncload b30.030e.pop.h.QSW_HTP.1870-01_cat_1999-12.nc QSW_HTP
SWe = QSW_HTP;
ncload b30.040e.pop.h.QSW_HTP.2000-01_cat_2099-12.nc QSW_HTP
SWe = cat(1,SWe,QSW_HTP);

ncload b30.030f.ES01.pop.h.LWDN_F.187001-199912.nc LWDN_F
LWdf = LWDN_F;
ncload b30.040f.ES01.pop.h.LWDN_F.200001-209912.nc LWDN_F
LWdf = cat(1,LWdf,LWDN_F);
ncload b30.030f.ES01.pop.h.LWUP_F.187001-199912.nc LWUP_F
LWuf = LWUP_F;
ncload b30.040f.ES01.pop.h.LWUP_F.200001-209912.nc LWUP_F
LWuf = cat(1,LWuf,LWUP_F);
ncload b30.030f.ES01.pop.h.QSW_HTP.187001-199912.nc QSW_HTP
SWf = QSW_HTP;
ncload b30.040f.ES01.pop.h.QSW_HTP.200001-209912.nc QSW_HTP
SWf = cat(1,SWf,QSW_HTP);

ncload b30.030g.ES01.pop.h.LWDN_F.1870-01_cat_1999-12.nc LWDN_F
LWdg = LWDN_F;
ncload b30.040g.ES01.pop.h.LWDN_F.200001-209912.nc LWDN_F
LWdg = cat(1,LWdg,LWDN_F);
ncload b30.030g.ES01.pop.h.LWUP_F.1870-01_cat_1999-12.nc LWUP_F
LWug = LWUP_F;
ncload b30.040g.ES01.pop.h.LWUP_F.200001-209912.nc LWUP_F
LWug = cat(1,LWug,LWUP_F);
ncload b30.030g.ES01.pop.h.QSW_HTP.1870-01_cat_1999-12.nc QSW_HTP
SWg = QSW_HTP;
ncload b30.040g.ES01.pop.h.QSW_HTP.200001-209912.nc QSW_HTP
SWg = cat(1,SWg,QSW_HTP);

clearvars QSW_HTP LWDN_F LWUP_F

save -v7.3 SWLW.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
load SWLW.mat

[nt nlat nlong] = size(LWub);
tmp = reshape(LWub,[12 nt/12 nlat nlong]);
Lub = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(LWdb,[12 nt/12 nlat nlong]);
Ldb = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(SWb,[12 nt/12 nlat nlong]);
Sb = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));

[ntc nlat nlong] = size(LWuc);
tmp = reshape(LWuc,[12 ntc/12 nlat nlong]);
Luc = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
Luc = cat(1,Luc',squeeze(nanmean(nanmean(LWuc40(:,lat1:lat2,long1:long2),3),2)));
tmp = reshape(LWdc,[12 ntc/12 nlat nlong]);
Ldc = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
Ldc = cat(1,Ldc',squeeze(nanmean(nanmean(LWdc40(:,lat1:lat2,long1:long2),3),2)));
tmp = reshape(SWc,[12 ntc/12 nlat nlong]);
Sc = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
Sc = cat(1,Sc',squeeze(nanmean(nanmean(SWc40(:,lat1:lat2,long1:long2),3),2)));

[nt nlat nlong] = size(LWue);
tmp = reshape(LWue,[12 nt/12 nlat nlong]);
Lue = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(LWde,[12 nt/12 nlat nlong]);
Lde = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(SWe,[12 nt/12 nlat nlong]);
Se = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));

tmp = reshape(LWuf,[12 nt/12 nlat nlong]);
Luf = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(LWdf,[12 nt/12 nlat nlong]);
Ldf = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(SWf,[12 nt/12 nlat nlong]);
Sf = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));

tmp = reshape(LWug,[12 nt/12 nlat nlong]);
Lug = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(LWdg,[12 nt/12 nlat nlong]);
Ldg = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));
tmp = reshape(SWg,[12 nt/12 nlat nlong]);
Sg = squeeze(nanmean(nanmean(nanmean(tmp(:,:,lat1:lat2,long1:long2),4),3),1));

clearvars LWug LWdg SWg LWub LWdb SWb LWue LWde SWe LWuf LWdf SWf LWuc LWdc SWc LWuc40 LWdc40 SWc40 nt ntc nlat nlong tmp lat1 lat2 latt1 latt2 long1 long2

save SWLWy.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load SWLWy.mat
load SWLW.mat

x = (1900:2099);
subplot(4,1,1)
plot(x,Ldb,'b',x,Lde(31:end),'b',x,Ldf(31:end),'b',x,Ldg(31:end),'b')
title('Long Wave heat flux warming the first ocean layer')
subplot(4,1,3)
plot(x,Sb,'b',x,Se(31:end),'b',x,Sf(31:end),'b',x,Sg(31:end),'b')
title('Short Wave heat flux warming the first ocean layer')
y = (1900:2099);
[nt nlat nlong] = size(LWdb);
x = (1:12);
tmp = reshape(LWdb,[12 nt/12 nlat nlong]);
scb1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scb2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scb3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scb4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWde);
tmp = reshape(LWde,[12 nt/12 nlat nlong]);
sce1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
sce2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
sce3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
sce4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWdf);
tmp = reshape(LWdf,[12 nt/12 nlat nlong]);
scf1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scf2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scf3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scf4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWdf);
tmp = reshape(LWdg,[12 nt/12 nlat nlong]);
scg1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scg2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scg3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scg4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
subplot(4,1,2)
plot(x,scb1,'b',x,scb2,'g',x,scb3,'r',x,scb4,'k',x,sce1,'b',x,sce2,'g',x,sce3,'r',x,sce4,'k',x,scf1,'b',x,scf2,'g', ...
	x,scf3,'r',x,scf4,'k',x,scg1,'b',x,scg2,'g',x,scg3,'r',x,scg4,'k')
title('Long wave seasonal cycle')
legend('1950s','2000s','2050s','2090s','Location','NorthWest')
xlim([1 12])
[nt nlat nlong] = size(SWb);
x = (1:12);
tmp = reshape(SWb,[12 nt/12 nlat nlong]);
scb1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scb2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scb3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scb4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWe);
tmp = reshape(SWe,[12 nt/12 nlat nlong]);
sce1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
sce2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
sce3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
sce4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWf);
tmp = reshape(SWf,[12 nt/12 nlat nlong]);
scf1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scf2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scf3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scf4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWf);
tmp = reshape(SWg,[12 nt/12 nlat nlong]);
scg1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scg2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scg3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scg4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
subplot(4,1,4)
plot(x,scb1,'b',x,scb2,'g',x,scb3,'r',x,scb4,'k',x,sce1,'b',x,sce2,'g',x,sce3,'r',x,sce4,'k',x,scf1,'b',x,scf2,'g', ...
	x,scf3,'r',x,scf4,'k',x,scg1,'b',x,scg2,'g',x,scg3,'r',x,scg4,'k')
title('Short wave seasonal cycle')
xlim([1 12])
legend('1950s','2000s','2050s','2090s','Location','NorthWest')

%print('LWSW','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear
load SWLWy.mat
ml = (Ldb+Lde(31:end)+Ldf(31:end)+Ldg(31:end))/4;
ms = (Sb+Se(31:end)+Sf(31:end)+Sg(31:end))/4;

load SWLW.mat

[nt nlat nlong] = size(LWdb);
tmp = reshape(LWdb,[12 nt/12 nlat nlong]);
scb1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scb2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scb3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scb4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWde);
tmp = reshape(LWde,[12 nt/12 nlat nlong]);
sce1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
sce2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
sce3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
sce4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWdf);
tmp = reshape(LWdf,[12 nt/12 nlat nlong]);
scf1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scf2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scf3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scf4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(LWdf);
tmp = reshape(LWdg,[12 nt/12 nlat nlong]);
scg1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scg2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scg3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scg4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
scl1 = (scb1+sce1+scf1+scg1)/4;
scl2 = (scb2+sce2+scf2+scg2)/4;
scl3 = (scb3+sce3+scf3+scg3)/4;
scl4 = (scb4+sce4+scf4+scg4)/4;


[nt nlat nlong] = size(SWb);
tmp = reshape(SWb,[12 nt/12 nlat nlong]);
scb1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scb2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scb3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scb4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWe);
tmp = reshape(SWe,[12 nt/12 nlat nlong]);
sce1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
sce2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
sce3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
sce4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWf);
tmp = reshape(SWf,[12 nt/12 nlat nlong]);
scf1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scf2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scf3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scf4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
[nt nlat nlong] = size(SWf);
tmp = reshape(SWg,[12 nt/12 nlat nlong]);
scg1 = nanmean(nanmean(nanmean(tmp(:,51:60,lat1:lat2,long1:long2),4),3),2);
scg2 = nanmean(nanmean(nanmean(tmp(:,101:110,lat1:lat2,long1:long2),4),3),2);
scg3 = nanmean(nanmean(nanmean(tmp(:,151:160,lat1:lat2,long1:long2),4),3),2);
scg4 = nanmean(nanmean(nanmean(tmp(:,end-10:end,lat1:lat2,long1:long2),4),3),2);
scs1 = (scb1+sce1+scf1+scg1)/4;
scs2 = (scb2+sce2+scf2+scg2)/4;
scs3 = (scb3+sce3+scf3+scg3)/4;
scs4 = (scb4+sce4+scf4+scg4)/4;








