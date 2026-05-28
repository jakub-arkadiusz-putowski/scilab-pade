mode(-1);
lines(0);

function main_builder()
    TOOLBOX_NAME  = "pade_toolbox";
    TOOLBOX_TITLE = "Pade Approximation Toolbox";
    toolbox_dir   = get_absolute_file_path();

    // Sprawdzenie modułów
    if ~isdef("tbx_build_loader") then
        error(msprintf("%s module not installed.", "modules_manager"));
    end

    // 1. Buduj tylko makra
    tbx_builder_macros(toolbox_dir);

    // 2. Generuj loader (TYLKO dla makr)
    // Używamy tbx_build_loader bez zbędnych argumentów
    tbx_build_loader(toolbox_dir);

    // 3. Generuj cleaner
    tbx_build_cleaner(toolbox_dir);

endfunction

main_builder();
clear main_builder;
