﻿using System.Reflection;
using System.Runtime.InteropServices;
using System.Security;

// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("YAF Providers")]
[assembly: AssemblyDescription("My SQL data layer for  YetAnotherForum")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("https://github.com/vzrus")]
[assembly: AssemblyProduct("YAF Providers")]
[assembly: AssemblyCopyright("Copyright © 2006-2011 Vladimir Zakharov")]
[assembly: AssemblyTrademark("vzrus")]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible 
// to COM components.  If you need to access a type in this assembly from 
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("26f518ec-9424-4d31-90fa-d1e5700b3c95")]

// Version information for an assembly consists of the following four values:
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:
[assembly: AssemblyVersion("1.9.6.0")]
[assembly: AssemblyFileVersion("1.9.6.0")]

#if (!COMPACT_FRAMEWORK)

[assembly: AllowPartiallyTrustedCallers]
#endif

[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile("..\\YetAnotherForum.NET.snk")]