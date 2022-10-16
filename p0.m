classdef p0
    %P0 Summary of this class goes here
    %   Detailed explanation goes here

    properties(Constant)        
        this_validate_NIA = @p0.validate_NIA
    end

    methods(Static)
        function datos_iniciales(nia1, nia2)
            if nargin < 1
                fprintf(2, "Debe proporcionar su NIA como primer argumento, p.ej.:\n");
                error(">> p0.datos_iniciales(123456, 234567)");
            else
                p0.validate_NIA(nia1);
            end

            if nargin < 2
                nia2 = 0;
            end
            if nia2 ~= 0
                this_validate_NIA(nia2);
            end

            if nia1 == 0 && nia2 == 0
                error("Debe proporcionar al menos un NIA")
            end

            rng(max(nia1, nia2));
            % rand
            if nia2 == 0
                fprintf("Inicialización de datos correcta\npara %d en SOLITARIO.\n", nia1)
            else
                fprintf("Inicialización de datos correcta\npara %d y %d en PAREJA.\n", nia1, nia2)
            end
        end

        function validate_NIA(nia)
            if strlength(sprintf("%d", nia)) ~= 6
                error("Valor de NIA incorrecto: %d", nia)
            end
        end
    end
end