/// @desc Returns index of first element that is greater or equal to value in the field provided
function binary_search_by_field_greater (_array, _field, _val)
{
	var _minIndex = -1;
	var _maxIndex = array_length(_array);
	
	while _minIndex + 1 < _maxIndex
	{
		var _index = (_minIndex + _maxIndex) div 2;
		
		var _foundVal = variable_struct_get(_array[_index], _field);
		
		if _foundVal < _val then _minIndex = _index;
		else _maxIndex = _index;
	}
	return _maxIndex;
}