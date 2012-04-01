// --------------------------------------------------------------------------------------------------------------------
// <copyright file="AssemblyInfo.cs" company="vzrus">
// Yet Another Forum.NET Firebird data layer by vzrus
// Copyright (C) 2006-2012 Vladimir Zakharov
// https://github.com/vzrus
// http://sourceforge.net/projects/yaf-datalayers/
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; version 2 only
// General class structure is based on MS SQL Server code,
// created by YAF developers
//
// http://www.yetanotherforum.net/
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; version 2
// of the License.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA./</copyright>
// <summary>
//   AssemblyInfo.cs
// </summary>
// --------------------------------------------------------------------------------------------------------------------

using System.Reflection;
using System.Runtime.InteropServices;
using System.Security;

// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("YAF.Classes.Data")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("vzrus https://github.com/vzrus/")]
[assembly: AssemblyProduct("YAF.Classes.Data")]
[assembly: AssemblyCopyright("Copyright © 2008-2012 Vladimir Zakharov")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible 
// to COM components.  If you need to access a type in this assembly from 
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("9870d063-5139-47fd-a64e-5d401415d6ab")]

// Version information for an assembly consists of the following four values:
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:
[assembly: AssemblyVersion("1.9.6.1")]
[assembly: AssemblyFileVersion("1.9.6.1")]

#if (!COMPACT_FRAMEWORK)

[assembly: AllowPartiallyTrustedCallers]
#endif

[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile("..\\..\\YetAnotherForum.NET.snk")]