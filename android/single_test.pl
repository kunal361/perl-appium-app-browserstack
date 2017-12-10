use Appium;

my $login = "USERNAME";
my $key = "ACCESS_KEY";
my $host = "$login:$key\@hub-cloud.browserstack.com";

my $caps = {
  "build" => "Perl Appium Sample",
  "name" => 'single_test',
  "device" => "Google Pixel",
  "browserstack.debug" => "true",
  "app" => "bs://<hashed app-id>"
};

my $driver = Appium->new({remote_server_addr => $host, port => '80', caps => $caps});

$driver->find_element( '//android.widget.TextView[@text="Search Wikipedia"]', 'xpath' )->click();

my $element = $driver->find_element( 'org.wikipedia.alpha:id/search_src_text', 'id' );
$element->click();
$element->send_keys('BrowserStack');

my @elements = $driver->find_elements( '//android.widget.TextView', 'xpath' );
my $size = 0+@elements;

if($size > 0){
  print "Found results - Test Passed\n";
} else {
  print "No results found - Test Failed\n";
}

$driver->quit();
