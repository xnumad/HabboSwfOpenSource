package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureAnimatedVisualization;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class TileCursorVisualization extends FurnitureAnimatedVisualization 
    {
        private var _tileHeight:Number = 0;


        public function get tileHeight():Number
        {
            return this._tileHeight;
        }

        public function set tileHeight(k:Number):void
        {
            this._tileHeight = k;
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_3 == 1)
            {
                this.tileHeight = object.getModel().getNumber(RoomObjectVariableEnum.TILE_CURSOR_HEIGHT);
                return -(this.tileHeight) * (k / 2);
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }
    }
}
