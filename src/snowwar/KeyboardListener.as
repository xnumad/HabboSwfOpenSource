package snowwar
{
	import com.sulake.core.runtime.IDisposable;
	import flash.display.Stage;
    import snowwar._Str_254.Direction8;
    import flash.events.KeyboardEvent;

    public class KeyboardListener implements IDisposable
	{
        private static const NUMBER_0:uint = 48;
        private static const NUMBER_1:uint = 49;
        private static const NUMBER_2:uint = 50;
        private static const NUMBER_3:uint = 51;
        private static const NUMBER_4:uint = 52;
        private static const NUMBER_5:uint = 53;
        private static const NUMBER_6:uint = 54;
        private static const NUMBER_7:uint = 55;
        private static const NUMBER_8:uint = 56;
        private static const NUMBER_9:uint = 57;
        private static const A:uint = 65;
        private static const B:uint = 66;
        private static const C:uint = 67;
        private static const D:uint = 68;
        private static const E:uint = 69;
        private static const F:uint = 70;
        private static const G:uint = 71;
        private static const H:uint = 72;
        private static const I:uint = 73;
        private static const J:uint = 74;
        private static const K:uint = 75;
        private static const L:uint = 76;
        private static const M:uint = 77;
        private static const N:uint = 78;
        private static const O:uint = 79;
        private static const P:uint = 80;
        private static const Q:uint = 81;
        private static const R:uint = 82;
        private static const S:uint = 83;
        private static const T:uint = 84;
        private static const U:uint = 85;
        private static const V:uint = 86;
        private static const W:uint = 87;
        private static const X:uint = 88;
        private static const Y:uint = 89;
        private static const Z:uint = 90;
        private static const SEMI_COLON:uint = 186;
        private static const EQUAL_SIGN:uint = 187;
        private static const COMMA:uint = 188;
        private static const DASH:uint = 189;
        private static const PERIOD:uint = 190;
        private static const FORWARD_SLASH:uint = 191;
        private static const GRAVE_ACCENT:uint = 192;
        private static const LEFT_BRACKET:uint = 219;
        private static const BACKSLASH:uint = 220;
        private static const CLOSE_BRACKET:uint = 221;
        private static const SINGLE_QUOTE:uint = 222;
        private static const ALT:uint = 18;
        private static const BACKSPACE:uint = 8;
        private static const CAPS_LOCK:uint = 20;
        private static const _SafeStr_22147:uint = 15;
        private static const CTRL:uint = 17;
        private static const DELETE:uint = 46;
        private static const DOWN:uint = 40;
        private static const END:uint = 35;
        private static const ENTER:uint = 13;
        private static const ESCAPE:uint = 27;
        private static const F1:uint = 112;
        private static const F2:uint = 113;
        private static const F3:uint = 114;
        private static const F4:uint = 115;
        private static const F5:uint = 116;
        private static const F6:uint = 117;
        private static const F7:uint = 118;
        private static const F8:uint = 119;
        private static const F9:uint = 120;
        private static const F10:uint = 121;
        private static const F11:uint = 122;
        private static const F12:uint = 123;
        private static const F13:uint = 124;
        private static const F14:uint = 125;
        private static const F15:uint = 126;
        private static const HOME:uint = 36;
        private static const INSERT:uint = 45;
        private static const LEFT:uint = 37;
        private static const _SafeStr_22152:uint = 21;
        private static const NUMPAD_0:uint = 96;
        private static const NUMPAD_1:uint = 97;
        private static const NUMPAD_2:uint = 98;
        private static const NUMPAD_3:uint = 99;
        private static const NUMPAD_4:uint = 100;
        private static const NUMPAD_5:uint = 101;
        private static const NUMPAD_6:uint = 102;
        private static const NUMPAD_7:uint = 103;
        private static const NUMPAD_8:uint = 104;
        private static const NUMPAD_9:uint = 105;
        private static const ADD:uint = 107;
        private static const DECIMAL_POINT:uint = 110;
        private static const DIVIDE:uint = 111;
        private static const _SafeStr_22156:uint = 108;
        private static const MULTIPLY:uint = 106;
        private static const SUBTRACT:uint = 109;
        private static const PAGE_DOWN:uint = 34;
        private static const PAGE_UP:uint = 33;
        private static const RIGHT:uint = 39;
        private static const SHIFT:uint = 16;
        private static const SPACE:uint = 32;
        private static const TAB:uint = 9;
        private static const UP:uint = 38;

        private var _stage:Stage;
        private var _charCodes:Array;
        private var _SafeStr_9514:Direction8;

        public function KeyboardListener(k:Stage)
        {
            this._charCodes = [];
            super();
            this._stage = k;
            k.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressedEvent);
            k.addEventListener(KeyboardEvent.KEY_UP, this.onKeyPressedEvent);
        }

        public function dispose():void
        {
            this._stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressedEvent);
            this._stage.removeEventListener(KeyboardEvent.KEY_UP, this.onKeyPressedEvent);
            this._stage = null;
            this._SafeStr_9514 = null;
            this._charCodes = [];
        }

        public function get disposed():Boolean
        {
            return false;
        }

        private function onKeyPressedEvent(k:KeyboardEvent):void
        {
            var _local_2:int = this._charCodes.indexOf(k.keyCode);
            switch (k.type)
            {
                case KeyboardEvent.KEY_DOWN:
                    if (_local_2 == -1)
                    {
                        this._charCodes.push(k.keyCode);
                    }
                    break;
                case KeyboardEvent.KEY_UP:
                    if (_local_2 > -1)
                    {
                        this._charCodes.splice(_local_2, 1);
                    }
                    break;
            }
            this._SafeStr_9514 = null;
            if (this._charCodes.length == 0)
            {
                return;
            }
            if (this._charCodes.length >= 2)
            {
                if (((this._SafeStr_22163(UP)) && (this._SafeStr_22163(LEFT))))
                {
                    this._SafeStr_9514 = Direction8.W;
                }
                else
                {
                    if (((this._SafeStr_22163(UP)) && (this._SafeStr_22163(RIGHT))))
                    {
                        this._SafeStr_9514 = Direction8.N;
                    }
                    else
                    {
                        if (((this._SafeStr_22163(DOWN)) && (this._SafeStr_22163(LEFT))))
                        {
                            this._SafeStr_9514 = Direction8.S;
                        }
                        else
                        {
                            if (((this._SafeStr_22163(DOWN)) && (this._SafeStr_22163(RIGHT))))
                            {
                                this._SafeStr_9514 = Direction8.E;
                            }
                        }
                    }
                }
            }
            else
            {
                if (this._SafeStr_22163(UP))
                {
                    this._SafeStr_9514 = Direction8.NW;
                }
                else
                {
                    if (this._SafeStr_22163(DOWN))
                    {
                        this._SafeStr_9514 = Direction8.SE;
                    }
                    else
                    {
                        if (this._SafeStr_22163(LEFT))
                        {
                            this._SafeStr_9514 = Direction8.SW;
                        }
                        else
                        {
                            if (this._SafeStr_22163(RIGHT))
                            {
                                this._SafeStr_9514 = Direction8.NE;
                            }
                            else
                            {
                                if (this._SafeStr_22163(Q))
                                {
                                    this._SafeStr_9514 = Direction8.W;
                                }
                                else
                                {
                                    if (this._SafeStr_22163(W))
                                    {
                                        this._SafeStr_9514 = Direction8.NW;
                                    }
                                    else
                                    {
                                        if (this._SafeStr_22163(E))
                                        {
                                            this._SafeStr_9514 = Direction8.N;
                                        }
                                        else
                                        {
                                            if (this._SafeStr_22163(A))
                                            {
                                                this._SafeStr_9514 = Direction8.SW;
                                            }
                                            else
                                            {
                                                if (this._SafeStr_22163(D))
                                                {
                                                    this._SafeStr_9514 = Direction8.NE;
                                                }
                                                else
                                                {
                                                    if (this._SafeStr_22163(Z))
                                                    {
                                                        this._SafeStr_9514 = Direction8.S;
                                                    }
                                                    else
                                                    {
                                                        if (this._SafeStr_22163(X))
                                                        {
                                                            this._SafeStr_9514 = Direction8.SE;
                                                        }
                                                        else
                                                        {
                                                            if (this._SafeStr_22163(C))
                                                            {
                                                                this._SafeStr_9514 = Direction8.E;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private function _SafeStr_22163(k:int):Boolean
        {
            return this._charCodes.indexOf(k) > -1;
        }

        public function get direction():Direction8
        {
            return this._SafeStr_9514;
        }
    }
}
