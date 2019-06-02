package com.sulake.core.window.graphics.renderer
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.utils.TextStyle;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class SkinRenderer implements ISkinRenderer 
    {
        protected static const _Str_3766:Dictionary = new Dictionary();

        private var _name:String;
        private var _disposed:Boolean = false;
        protected var _Str_4990:Dictionary;
        protected var _Str_5217:Dictionary;
        protected var _Str_5788:Dictionary;
        protected var _Str_5580:Dictionary;

        {
            _Str_3766[TextStyle.TOP_LEFT] = {
                "x":-1,
                "y":-1
            }
            _Str_3766[TextStyle.TOP] = {
                "x":0,
                "y":-1
            }
            _Str_3766[TextStyle.TOP_RIGHT] = {
                "x":1,
                "y":-1
            }
            _Str_3766[TextStyle.LEFT] = {
                "x":-1,
                "y":0
            }
            _Str_3766[TextStyle.RIGHT] = {
                "x":1,
                "y":0
            }
            _Str_3766[TextStyle.BOTTOM_LEFT] = {
                "x":-1,
                "y":1
            }
            _Str_3766[TextStyle.BOTTOM] = {
                "x":0,
                "y":1
            }
            _Str_3766[TextStyle.BOTTOM_RIGHT] = {
                "x":1,
                "y":1
            }
        }

        public function SkinRenderer(k:String)
        {
            this._name = k;
            this._Str_4990 = new Dictionary();
            this._Str_5217 = new Dictionary();
            this._Str_5788 = new Dictionary();
            this._Str_5580 = new Dictionary();
        }

        public function get name():String
        {
            return this._name;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function parse(k:IAsset, _arg_2:XMLList, _arg_3:IAssetLibrary):void
        {
        }

        public function dispose():void
        {
            var k:String;
            if (!this._disposed)
            {
                for (k in this._Str_5788)
                {
                    ISkinLayout(this._Str_5788[k]).dispose();
                    delete this._Str_5788[k];
                }
                this._Str_5788 = null;
                this._Str_5580 = null;
                for (k in this._Str_4990)
                {
                    ISkinTemplate(this._Str_4990[k]).dispose();
                    delete this._Str_4990[k];
                }
                this._Str_4990 = null;
                this._Str_5217 = null;
            }
        }

        public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
        }

        public function isStateDrawable(k:uint):Boolean
        {
            return false;
        }

        public function _Str_22661(k:uint):ISkinLayout
        {
            return this._Str_5580[k];
        }

        public function _Str_21977(k:uint, _arg_2:String):void
        {
            var _local_3:ISkinLayout = this._Str_5788[_arg_2];
            if (_local_3 == null)
            {
                throw (new Error((('Layout "' + _arg_2) + '" not found in renderer!')));
            }
            this._Str_5580[k] = _local_3;
        }

        public function _Str_19884(k:uint):void
        {
            delete this._Str_5580[k];
        }

        public function _Str_23297(k:uint):Boolean
        {
            return !(this._Str_5580[k] == null);
        }

        public function _Str_25215(k:uint):ISkinTemplate
        {
            return this._Str_5217[k];
        }

        public function _Str_19639(k:uint, _arg_2:String):void
        {
            var _local_3:ISkinTemplate = this._Str_4990[_arg_2];
            if (_local_3 == null)
            {
                throw (new Error((('Template "' + _arg_2) + '" not found in renderer!')));
            }
            this._Str_5217[k] = _local_3;
        }

        public function _Str_21934(k:uint):void
        {
            delete this._Str_5217[k];
        }

        public function _Str_25392(k:uint):Boolean
        {
            return !(this._Str_5217[k] == null);
        }

        public function _Str_20341(k:ISkinLayout):ISkinLayout
        {
            this._Str_5788[k.name] = k;
            return k;
        }

        public function _Str_22665(k:String):ISkinLayout
        {
            return this._Str_5788[k];
        }

        public function _Str_22572(k:ISkinLayout):ISkinLayout
        {
            var _local_2:Object;
            var _local_3:uint;
            k = this._Str_4990[k.name];
            if (k != null)
            {
                for (_local_2 in this._Str_5580)
                {
                    _local_3 = (_local_2 as uint);
                    if (this._Str_5580[_local_3] == k)
                    {
                        this._Str_19884(_local_3);
                    }
                }
                delete this._Str_5788[k.name];
            }
            return k;
        }

        public function _Str_21576(k:ISkinTemplate):ISkinTemplate
        {
            this._Str_4990[k.name] = k;
            return k;
        }

        public function _Str_23196(k:String):ISkinTemplate
        {
            return this._Str_4990[k];
        }

        public function _Str_22597(k:ISkinTemplate):ISkinTemplate
        {
            var _local_2:Object;
            var _local_3:uint;
            k = this._Str_4990[k.name];
            if (k != null)
            {
                for (_local_2 in this._Str_5217)
                {
                    _local_3 = (_local_2 as uint);
                    if (this._Str_5217[_local_3] == k)
                    {
                        this._Str_21934(_local_3);
                    }
                }
                delete this._Str_4990[k.name];
            }
            return k;
        }
    }
}
