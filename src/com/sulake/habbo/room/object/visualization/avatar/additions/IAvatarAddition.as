package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public interface IAvatarAddition extends IDisposable 
    {
        function get id():int;
        function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void;
        function animate(_arg_1:IRoomObjectSprite):Boolean;
    }
}
