package snowwar._Str_267
{
	import com.sulake.habbo.communication.messages.parser.game.score._Str_3326;
	import com.sulake.core.communication.messages.IMessageComposer;
	import snowwar._Str_477._SafeStr_3694;
	import snowwar.SnowWarEngine;

    public class LeaderboardTable 
    {
        public static const _SafeStr_22045:int = 0;
        public static const _SafeStr_22046:int = 1;

        protected var _SafeStr_18579:SnowWarEngine;
        protected var _SafeStr_22047:Boolean;
        protected var _SafeStr_12643:int;
        protected var _disposed:Boolean;
        protected var _SafeStr_13384:Array;
        protected var _SafeStr_22048:int = -1;
        protected var _SafeStr_21821:int;
        protected var _SafeStr_22049:int = 8;
        protected var _SafeStr_22050:int = 50;
        protected var _SafeStr_22051:Boolean = true;
        protected var _SafeStr_22052:int;

        public function LeaderboardTable(k:SnowWarEngine)
        {
            this._SafeStr_18579 = k;
            this._SafeStr_12643 = this._SafeStr_18579.sessionDataManager.userId;
            this._SafeStr_22049 = this._SafeStr_18579.config.getInteger("games.highscores.viewSize", 8);
            this._SafeStr_22050 = this._SafeStr_18579.config.getInteger("games.highscores.windowSize", 50);
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._SafeStr_22053();
            this._SafeStr_18579 = null;
            this._SafeStr_13384 = null;
            this._disposed = true;
        }

        public function _SafeStr_22053():void
        {
            this._SafeStr_22048 = -1;
            this._SafeStr_13384 = null;
            this._SafeStr_21821 = -1;
            this._SafeStr_22051 = true;
        }

        public function addEntries(k:Array, _arg_2:int):void
        {
            this._SafeStr_21821 = _arg_2;
            if (!this._SafeStr_13384)
            {
                this._SafeStr_13384 = k;
                this.initializeList();
            }
            else
            {
                this._SafeStr_13384 = k;
                this._SafeStr_22054();
            }
            this._SafeStr_22051 = false;
        }

        protected function initializeList():void
        {
            var k:int;
            var _local_2:int;
            while (_local_2 < this._SafeStr_13384.length)
            {
                if ((this._SafeStr_13384[_local_2] as _Str_3326).userId == this._SafeStr_12643)
                {
                    k = _local_2;
                    break;
                }
                _local_2++;
            }
            if (k >= this._SafeStr_22049)
            {
                this._SafeStr_22048 = (k - (this._SafeStr_22049 / 2));
            }
            else
            {
                this._SafeStr_22048 = 0;
            }
        }

        private function _SafeStr_22054():void
        {
            if (this._SafeStr_22048 < 0)
            {
                this._SafeStr_22048 = (this._SafeStr_22048 + this._SafeStr_22050);
            }
            else
            {
                this._SafeStr_22048 = (this._SafeStr_22048 - this._SafeStr_22050);
            }
        }

        public function _SafeStr_6727():Boolean
        {
            return !(this._SafeStr_13384 == null);
        }

        public function scrollUp():Boolean
        {
            var k:int;
            var _local_2:IMessageComposer;
            if (this._SafeStr_22051)
            {
                return false;
            }
            this._SafeStr_22048 = (this._SafeStr_22048 - this._SafeStr_22049);
            if (this._SafeStr_22048 < 0)
            {
                if (this._SafeStr_13384[0].rank > 1)
                {
                    k = Math.max(1, (this._SafeStr_13384[0].rank - this._SafeStr_22050));
                    _local_2 = this.getMessageComposer(this._SafeStr_22052, k, _SafeStr_22046);
                    this._SafeStr_18579.communication.connection.send(_local_2);
                    this._SafeStr_22051 = true;
                    return false;
                }
                this._SafeStr_22048 = 0;
            }
            return true;
        }

        protected function getMessageComposer(k:int, _arg_2:int, _arg_3:int):IMessageComposer
        {
            return new _SafeStr_3694(k, _arg_2, _arg_3, this._SafeStr_22049, this._SafeStr_22050);
        }

        public function scrollDown():Boolean
        {
            var k:int;
            var _local_2:IMessageComposer;
            if (this._SafeStr_22051)
            {
                return false;
            }
            this._SafeStr_22048 = (this._SafeStr_22048 + this._SafeStr_22049);
            if ((this._SafeStr_22048 + this._SafeStr_22049) >= this._SafeStr_13384.length)
            {
                if (this._SafeStr_13384[(this._SafeStr_13384.length - 1)].rank < this._SafeStr_21821)
                {
                    k = (this._SafeStr_13384[(this._SafeStr_13384.length - 1)].rank + 1);
                    _local_2 = this.getMessageComposer(this._SafeStr_22052, k, _SafeStr_22045);
                    this._SafeStr_18579.communication.connection.send(_local_2);
                    this._SafeStr_22051 = true;
                    return false;
                }
            }
            return true;
        }

        public function _SafeStr_18662(k:int):void
        {
            this._SafeStr_22053();
            var _local_2:IMessageComposer = this.getMessageComposer(k, -1, _SafeStr_22045);
            this._SafeStr_18579.communication.connection.send(_local_2);
            this._SafeStr_22051 = true;
            this._SafeStr_22052 = k;
        }

        public function getVisibleEntries():Array
        {
            var k:Array = [];
            if (!this._SafeStr_13384)
            {
                return k;
            }
            var _local_2:int = Math.min(this._SafeStr_13384.length, (this._SafeStr_22048 + this._SafeStr_22049));
            var _local_3:int = this._SafeStr_22048;
            while (_local_3 < _local_2)
            {
                k.push(this._SafeStr_13384[_local_3]);
                _local_3++;
            }
            return k;
        }

        public function _SafeStr_18663():Boolean
        {
            if ((((this._SafeStr_22051) || (!(this._SafeStr_13384))) || (this._SafeStr_13384.length == 0)))
            {
                return false;
            }
            if (((this._SafeStr_13384[0].rank == 1) && (this._SafeStr_22048 <= 0)))
            {
                return false;
            }
            return true;
        }

        public function _SafeStr_18664():Boolean
        {
            if ((((this._SafeStr_22051) || (!(this._SafeStr_13384))) || (this._SafeStr_13384.length == 0)))
            {
                return false;
            }
            if (((this._SafeStr_13384[(this._SafeStr_13384.length - 1)].rank >= this._SafeStr_21821) && ((this._SafeStr_22048 + this._SafeStr_22049) >= this._SafeStr_13384.length)))
            {
                return false;
            }
            return true;
        }

        public function get viewSize():int
        {
            return this._SafeStr_22049;
        }
    }
}
