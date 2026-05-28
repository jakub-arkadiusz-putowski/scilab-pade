function buildmacros()
    macros_path = get_absolute_file_path("buildmacros.sce");
    // To polecenie skompiluje pade.sci do pliku binarnego i stworzy bibliotekę
    tbx_build_macros("pade_toolbox", macros_path);
endfunction

buildmacros();
clear buildmacros;
