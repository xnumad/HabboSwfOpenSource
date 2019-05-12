package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import flash.geom.Rectangle;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class ChatBubbleSimulationEntity 
    {
        public static const _Str_13872:int = 10;

        protected const _Str_20405:Number = 0.1;
        private const _Str_13725:int = 2500;

        protected var _visualization:PooledChatBubble;
        protected var _x:Number;
        protected var _y:Number;
        protected var _Str_2700:Rectangle;
        protected var _Str_2864:Rectangle = null;
        protected var _Str_14799:Number;
        protected var _Str_15544:Number;
        private var _Str_12299:Vector.<ChatBubbleSimulationEntity>;
        private var _isSpacer:Boolean = false;

        public function ChatBubbleSimulationEntity(k:PooledChatBubble, _arg_2:Boolean=false)
        {
            this._Str_2700 = new Rectangle();
            this._Str_12299 = new Vector.<ChatBubbleSimulationEntity>(0);
            super();
            this._visualization = k;
            var _local_3:Rectangle = k.overlap;
            this._x = (k.x + ((_local_3) ? _local_3.x : 0));
            this._y = (k.y + ((_local_3) ? _local_3.y : 0));
            this._Str_2700.x = this._x;
            this._Str_2700.y = this._y;
            this._Str_2700.width = (this._visualization.width - ((_local_3) ? (_local_3.x + _local_3.width) : 0));
            this._Str_2700.height = ((this._visualization._Str_22234 - _Str_13872) - ((_local_3) ? (_local_3.y + _local_3.height) : 0));
            if (this._visualization.minHeight != -1)
            {
                this._Str_2700.height = this._visualization.minHeight;
            }
            if (_arg_2)
            {
                this._Str_2864 = new Rectangle();
                this._Str_2864.width = (this._Str_2700.width + (2 * this._Str_13725));
                this._Str_2864.height = ((this._visualization.minHeight != -1) ? this._visualization.minHeight : (this._Str_2700.height / 2));
                this._Str_2864.x = (this._Str_2700.x - this._Str_13725);
                this._Str_2864.y = this._Str_2700.y;
            }
        }

        public function dispose():void
        {
            if (this._visualization)
            {
                this._visualization._Str_4702 = true;
            }
            this._visualization = null;
            this._Str_2700 = null;
            this._Str_12299 = null;
            this._Str_2864 = null;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function set y(k:Number):void
        {
            this._y = k;
            this._Str_2700.y = this._y;
            if (this._Str_2864)
            {
                this._Str_2864.y = this._Str_2700.y;
            }
        }

        public function get x():Number
        {
            return this._x;
        }

        public function set x(k:Number):void
        {
            this._x = (this._x + ((k - this._x) * (1 - this._Str_20405)));
            this._Str_2700.x = this._x;
            if (this._Str_2864)
            {
                this._Str_2864.x = (this._Str_2700.x - this._Str_13725);
            }
        }

        public function get _Str_6163():Rectangle
        {
            return this._Str_2700;
        }

        public function get _Str_10759():Rectangle
        {
            return (this._Str_2864) ? this._Str_2864 : this._Str_2700;
        }

        public function get _Str_20442():Boolean
        {
            return !(this._Str_2864 == null);
        }

        public function get _Str_13971():Number
        {
            return this._x + (this._Str_2700.width / 2);
        }

        public function initializePosition(k:Number, _arg_2:Number):void
        {
            var _local_3:Rectangle = this._visualization.overlap;
            this._x = (k + ((_local_3) ? _local_3.x : 0));
            this._y = (_arg_2 + ((_local_3) ? _local_3.y : 0));
            this._Str_2700.x = this._x;
            this._Str_2700.y = this._y;
            if (this._Str_2864)
            {
                this._Str_2864.x = (this._Str_2700.x - this._Str_13725);
                this._Str_2864.y = this._Str_2700.y;
            }
        }

        public function _Str_20224(k:Number):void
        {
            this._Str_14799 = (this._Str_14799 + k);
        }

        public function _Str_13441(k:ChatBubbleSimulationEntity):void
        {
            this._Str_12299.push(k);
        }

        public function _Str_14539(k:ChatBubbleSimulationEntity):Boolean
        {
            return !(this._Str_12299.indexOf(k) == -1);
        }

        public function _Str_13455(k:Number):void
        {
            this._Str_15544 = (this._Str_15544 + k);
        }

        public function _Str_23082(k:int):void
        {
            this.x = (this.x + this._Str_14799);
            this.y = (this.y + Math.max(this._Str_15544, -(k)));
        }

        public function _Str_23377():void
        {
            this._Str_14799 = 0;
            this._Str_15544 = 0;
            this._Str_12299 = new Vector.<ChatBubbleSimulationEntity>(0);
        }

        public function _Str_18740(k:Boolean=false):void
        {
            var _local_2:Rectangle = this._visualization.overlap;
            if (!k)
            {
                this._visualization.moveTo(int((this._x - ((_local_2) ? _local_2.x : 0))), int((this._y - ((_local_2) ? _local_2.y : 0))));
            }
            else
            {
                this._visualization._Str_12023(int((this._x - ((_local_2) ? _local_2.x : 0))), int((this._y - ((_local_2) ? _local_2.y : 0))));
            }
        }

        public function set fullHeightCollision(k:Boolean):void
        {
            if (this._Str_2864)
            {
                this._Str_2864.height = ((k) ? this._Str_2700.height : (this._Str_2700.height / 2));
            }
        }

        public function get _Str_25178():Boolean
        {
            return this._visualization._Str_19538;
        }

        public function set _Str_4702(k:Boolean):void
        {
            this._visualization._Str_4702 = k;
        }

        public function get _Str_4702():Boolean
        {
            return this._visualization._Str_4702;
        }

        public function get timeStamp():uint
        {
            return this._visualization.timeStamp;
        }

        public function get isSpacer():Boolean
        {
            return this._isSpacer;
        }

        public function set isSpacer(k:Boolean):void
        {
            this._isSpacer = k;
        }

        public function _Str_25372(k:ChatBubbleSimulationEntity):Boolean
        {
            if (this._Str_2864)
            {
                return (this._Str_2700.intersects(k._Str_2700)) || (this._Str_2864.intersects(k._Str_10759));
            }
            if (k._Str_2864)
            {
                return (this._Str_2700.intersects(k._Str_2700)) || (this._Str_2700.intersects(k._Str_2864));
            }
            return this._Str_2700.intersects(k._Str_2700);
        }

        public function _Str_23025(k:ChatBubbleSimulationEntity):Boolean
        {
            return this._Str_2700.intersects(k._Str_2700);
        }
    }
}
