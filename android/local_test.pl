use Appium;

my $login = "USERNAME";
my $key = "ACCESS_KEY";
my $host = "$login:$key\@hub-cloud.browserstack.com";

my $caps = {
  "build" => "Perl Appium Sample",
  "name" => 'local_test',
  "device" => "Google Pixel",
  "browserstack.local" => "true",
  "browserstack.debug" => "true",
  "app" => "bs://<hashed app-id>"
};

my $driver = Appium->new({remote_server_addr => $host, port => '80', caps => $caps});

$driver->find_element('com.example.android.basicnetworking:id/test_action', 'id')->click();

sleep 2;

my @eles = $driver->find_elements('//android.widget.TextView', 'xpath');

my $passed = 0;

foreach (@eles){
  my $text = $_->get_text();
  $passed = 1 if($text =~ 'Up and running');
}

$passed ? print "Test Passed\n" : print "Test Failed\n";

$driver->quit();
