//com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public /*dynamic*/ interface IAvatarAddition extends IDisposable {

        function get id():int;
        function update(k:IRoomObjectSprite, _arg_2:Number):void;
        function animate(k:IRoomObjectSprite):Boolean;

    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

