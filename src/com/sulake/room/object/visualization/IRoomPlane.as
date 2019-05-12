package com.sulake.room.object.visualization
{
    import com.sulake.room.utils.IVector3D;
    import com.sulake.room.utils.IRoomGeometry;

    public interface IRoomPlane 
    {
        function get uniqueId():int;
        function get location():IVector3D;
        function get _Str_5424():IVector3D;
        function get _Str_4968():IVector3D;
        function get color():uint;
        function _Str_22136(_arg_1:IRoomGeometry):Array;
    }
}
