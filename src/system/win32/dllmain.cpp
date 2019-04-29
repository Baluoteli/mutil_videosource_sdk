//
//  Agora Media SDK
//
//  Created by Sting Feng in 2015-05.
//  Copyright (c) 2015 Agora IO. All rights reserved.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
namespace agora {
	namespace win32 {
	HMODULE g_hInstDll;
	}
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  dwReason,
                       LPVOID lpReserved
					 )
{
	switch (dwReason)
	{
	case DLL_PROCESS_ATTACH:
		agora::win32::g_hInstDll = hModule;
		DisableThreadLibraryCalls(hModule);
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}
