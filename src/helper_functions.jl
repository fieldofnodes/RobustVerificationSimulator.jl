"""
    Get ratio of occurence between two types
    """
    function get_ratio_between_two_types(types_vec,types_test)

        N = length(types_vec)

        count_of_type1 = sum(map(r -> r isa typeof(types_test[1]),types_vec))
        count_of_type2 = sum(map(r -> r isa typeof(types_test[2]),types_vec))

        ratio_of_type1 = count_of_type1/N
        ratio_of_type2 = count_of_type2/N
        type1_str = replace(string(types_test[1]),"()"=>"")
        type2_str = replace(string(types_test[2]),"()"=>"")

        results = (
            type1 = (type1_str,ratio_of_type1),
            type2 = (type2_str, ratio_of_type2))
        return results
    end

"""
    Draw random integer either 0 or 1
"""
rand_int() = rand([0,1])