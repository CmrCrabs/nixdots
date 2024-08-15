{ stdenv, lib, fetchFromGitHub, kernel, kmod }:

stdenv.mkDerivation rec {
 pname = "asus-wmi-screenpad";
 version = "1.0";

 src = fetchFromGitHub {
    owner = "Plippo";
    repo = "asus-wmi-screenpad";
    rev = "master";
    sha256 = "1l25q7rxyv65iwc9b1r96agcwpr7jfxirfi4x92631l91qpwi7ly";
 };

 hardeningDisable = [ "pic" ];
 nativeBuildInputs = kernel.moduleBuildDependencies;


 makeFlags = [
   "KERNELRELEASE=${kernel.modDirVersion}"                                 
   "K_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"    
   "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"    
   "INSTALL_MOD_PATH=$(out)"                                               
 ];
 
 meta = with lib; {
    description = "ASUS WMI ScreenPad Plus kernel module";
    homepage = "https://github.com/Plippo/asus-wmi-screenpad";
    license = licenses.gpl2;
    maintainers = with maintainers; [ CmrCrabs ];
    platforms = platforms.linux;
 };
}

