use inc::Module::Install;

name 'HTML-FormFu-Imager';
all_from 'lib/HTML/FormFu/Imager.pm';

repository 'http://html-formfu.googlecode.com/svn/trunk/HTML-FormFu-Imager';

requires 'HTML::FormFu';
requires 'Imager';

license 'perl';

&WriteAll;
