use Appium;

my $login = "USERNAME";
my $key = "ACCESS_KEY";
my $host = "$login:$key\@hub-cloud.browserstack.com";

my $caps = {
  "build" => "Perl Appium Sample",
  "name" => 'local_test',
  "device" => "iPhone 7",
  "browserstack.local" => "true",
  "browserstack.debug" => "true",
  "app" => "bs://<hashed app-id>",
  "automationName" => "XCUITest"
};

my $driver = Appium->new({remote_server_addr => $host, port => '80', caps => $caps});

$driver->find_element('//XCUIElementTypeButton[@name="TestBrowserStackLocal"]', 'xpath')->click();

sleep 2;

my $result = $driver->find_element('//XCUIElementTypeStaticText[@name="ResultBrowserStackLocal"]', 'xpath')->get_text();

($result =~ "Response is: Up and running") ? print "Test Passed\n" : print "Test Failed\n";

$driver->quit();
