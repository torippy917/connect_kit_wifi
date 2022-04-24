#pragma comment(lib,"wininet")
#include <windows.h>
#include <wininet.h>
int main() {
	BOOL bResult1 = InternetSetOption(0, INTERNET_OPTION_SETTINGS_CHANGED, 0, 0);
	BOOL bResult2 = InternetSetOption(0, INTERNET_OPTION_REFRESH, 0, 0);
	return bResult1 && bResult2;
}