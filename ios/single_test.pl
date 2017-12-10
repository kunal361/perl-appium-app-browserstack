use Appium;

my $login = "USERNAME";
my $key = "ACCESS_KEY";
my $host = "$login:$key\@hub-cloud.browserstack.com";

my $caps = {
  "build" => "Perl Appium Sample",
  "name" => 'single_test',
  "device" => "iPhone 7",
  "browserstack.debug" => "true",
  "app" => "bs://<hashed app-id>",
  "automationName" => "XCUITest"
};

my $driver = Appium->new({remote_server_addr => $host, port => '80', caps => $caps});

$driver->find_element('//XCUIElementTypeButton[@label="Log In"]', 'xpath')->click();

my $email_field = $driver->find_element('//XCUIElementTypeTextField[@value="Email address"]', 'xpath');
$email_field->click();
$email_field->send_keys('hello@browserstack.com');

$driver->find_element('//XCUIElementTypeButton[@name="Next Button"]', 'xpath')->click();

@results = $driver->find_elements('//XCUIElementTypeStaticText', 'xpath');

$passed = 0;

foreach (@results) {
  my $text = $_->get_text();
  $passed = 1 if($text =~ 'not registered on WordPress.com');
}

$passed ? print "Test Passed\n" : print "Test Failed\n";

$driver->quit();
