use inc::Module::Install;

name 'HTML-FormFu-Imager';
all_from 'lib/HTML/FormFu/Imager.pm';

requires 'HTML::FormFu';
requires 'Imager';

license 'perl';

auto_install();
&WriteAll;
