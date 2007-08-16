use inc::Module::Install;

name 'HTML-FormFu-Imager';
all_from 'lib/HTML/FormFu/Inflator/Imager.pm';

requires 'perl' => '5.8.1';
requires 'HTML::FormFu';
requires 'Imager';

license 'perl';

&WriteAll;
