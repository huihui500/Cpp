# 常用c++

## 时间
``` c++
#include <iostream>
#include <chrono>
#include <string>
using namespace std;
 
int main()
{
	time_t timestamp = chrono::system_clock::now().time_since_epoch().count()/chrono::system_clock::period::den;
	struct tm* tLocal = localtime(&timestamp);
	char tStr[50] = {0};
	snprintf(tStr, sizeof(tStr), "%04d-%02d-%02d %02d:%02d:%02d", (1900 + tLocal->tm_year), ( 1 + tLocal->tm_mon), tLocal->tm_mday, tLocal->tm_hour, tLocal->tm_min, tLocal->tm_sec);
    std::string timestamp(tStr);
	cout<<tStr << endl << timestamp <<endl;
    return 0;
}
```
