package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class ExpressionAddition implements IExpressionAddition 
    {
        protected var _id:int;
        protected var _Str_1070:AvatarVisualization;
        private var _type:int = -1;

        public function ExpressionAddition(k:int, _arg_2:int, _arg_3:AvatarVisualization)
        {
            this._type = _arg_2;
            this._id = k;
            this._Str_1070 = _arg_3;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get disposed():Boolean
        {
            return this._Str_1070 == null;
        }

        public function dispose():void
        {
            this._Str_1070 = null;
        }

        public function update(k:IRoomObjectSprite, _arg_2:Number):void
        {
        }

        public function animate(k:IRoomObjectSprite):Boolean
        {
            return false;
        }
    }
}
