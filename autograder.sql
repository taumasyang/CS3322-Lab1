drop database if exists t1;
create database t1;
use t1;
source public-test/data/load-data-1,2.sql
source answer/scene-1.sql
source public-test/test/scene-1-test.sql
source answer/scene-2.sql
source public-test/test/scene-2-test.sql
drop database if exists t1;

drop database if exists t3;
create database t3;
use t3;
source public-test/data/load-data-3,4,5.sql
source answer/scene-3.sql
source public-test/test/scene-3-test.sql
drop database if exists t3;

drop database if exists t4;
create database t4;
use t4;
source public-test/data/load-data-3,4,5.sql
source answer/scene-4.1.sql
source public-test/test/scene-4.1-test.sql
source answer/scene-4.2.1.sql
source answer/scene-4.2.2.sql
source answer/scene-4.2.3.sql
source public-test/test/scene-4.2-test.sql
drop database if exists t4;

drop database if exists t5;
create database t5;
use t5;
source public-test/data/load-data-3,4,5.sql
source answer/scene-5.sql
source public-test/test/scene-5-test.sql
drop database if exists t5;
