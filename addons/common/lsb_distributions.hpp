// https://community.bistudio.com/wiki/Example_Code:_Random_Area_Distribution
class lsb_distributions {
    class randomArea {
        displayName = CSTRING(distribution_randomArea);
        function = QUOTE(call FUNC(distribution_randomArea));
    };
    class gaussian {
        displayName = CSTRING(distribution_gaussian);
        function = QUOTE(call FUNC(distribution_gaussian));
    };
};
