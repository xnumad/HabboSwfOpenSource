package deng.fzip
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import flash.net.URLStream;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ProgressEvent;
    import flash.utils.*;
    import flash.events.*;

    public class FZip extends EventDispatcher 
    {
        internal static const _Str_1517:uint = 33639248;
        internal static const _Str_2215:uint = 808471376;
        internal static const _Str_1265:uint = 67324752;
        internal static const _Str_2045:uint = 84233040;
        internal static const _Str_1758:uint = 101010256;
        internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:uint = 101075792;
        internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:uint = 117853008;
        internal static const _Str_1548:uint = 134695760;
        internal static const _Str_1224:uint = 134630224;
        internal static const _Str_1080:uint = 134695760;

        protected var _Str_1974:Array;
        protected var _Str_1485:Dictionary;
        protected var _Str_1578:URLStream;
        protected var _Str_1902:String;
        protected var _Str_675:Function;
        protected var _Str_1618:FZipFile;
        protected var _Str_2114:ByteArray;
        protected var _Str_2253:uint;
        protected var _Str_1831:uint;

        public function FZip(k:String="utf-8")
        {
            this._Str_1902 = k;
            this._Str_675 = this._Str_1922;
        }

        public function get active():Boolean
        {
            return !(this._Str_675 === this._Str_1922);
        }

        public function load(k:URLRequest):void
        {
            if (((!(this._Str_1578)) && (this._Str_675 == this._Str_1922)))
            {
                this._Str_1578 = new URLStream();
                this._Str_1578.endian = Endian.LITTLE_ENDIAN;
                this._Str_1740();
                this._Str_1974 = [];
                this._Str_1485 = new Dictionary();
                this._Str_675 = this._Str_1084;
                this._Str_1578.load(k);
            }
        }

        public function loadBytes(k:ByteArray):void
        {
            if (((!(this._Str_1578)) && (this._Str_675 == this._Str_1922)))
            {
                this._Str_1974 = [];
                this._Str_1485 = new Dictionary();
                k.position = 0;
                k.endian = Endian.LITTLE_ENDIAN;
                this._Str_675 = this._Str_1084;
                if (this.parse(k))
                {
                    this._Str_675 = this._Str_1922;
                    dispatchEvent(new Event(Event.COMPLETE));
                }
                else
                {
                    dispatchEvent(new _Str_897(_Str_897.PARSEERROR, "EOF"));
                }
            }
        }

        public function close():void
        {
            if (this._Str_1578)
            {
                this._Str_675 = this._Str_1922;
                this._Str_2076();
                this._Str_1578.close();
                this._Str_1578 = null;
            }
        }

        public function _Str_1294(k:IDataOutput, _arg_2:Boolean=false):void
        {
            var _local_3:String;
            var _local_4:ByteArray;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:int;
            var _local_8:FZipFile;
            if (((!(k == null)) && (this._Str_1974.length > 0)))
            {
                _local_3 = k.endian;
                _local_4 = new ByteArray();
                k.endian = (_local_4.endian = Endian.LITTLE_ENDIAN);
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = 0;
                while (_local_7 < this._Str_1974.length)
                {
                    _local_8 = (this._Str_1974[_local_7] as FZipFile);
                    if (_local_8 != null)
                    {
                        _local_8._Str_1294(_local_4, _arg_2, true, _local_5);
                        _local_5 = (_local_5 + _local_8._Str_1294(k, _arg_2));
                        _local_6++;
                    }
                    _local_7++;
                }
                if (_local_4.length > 0)
                {
                    k.writeBytes(_local_4);
                }
                k.writeUnsignedInt(_Str_1758);
                k.writeShort(0);
                k.writeShort(0);
                k.writeShort(_local_6);
                k.writeShort(_local_6);
                k.writeUnsignedInt(_local_4.length);
                k.writeUnsignedInt(_local_5);
                k.writeShort(0);
                k.endian = _local_3;
            }
        }

        public function _Str_1455():uint
        {
            return (this._Str_1974) ? this._Str_1974.length : 0;
        }

        public function _Str_1988(k:uint):FZipFile
        {
            return (this._Str_1974) ? (this._Str_1974[k] as FZipFile) : null;
        }

        public function _Str_1843(k:String):FZipFile
        {
            return (this._Str_1485[k]) ? (this._Str_1485[k] as FZipFile) : null;
        }

        public function _Str_2254(k:String, _arg_2:ByteArray=null, _arg_3:Boolean=true):FZipFile
        {
            return this._Str_2171(((this._Str_1974) ? this._Str_1974.length : 0), k, _arg_2, _arg_3);
        }

        public function _Str_1432(k:String, _arg_2:String, _arg_3:String="utf-8", _arg_4:Boolean=true):FZipFile
        {
            return this._Str_2177(((this._Str_1974) ? this._Str_1974.length : 0), k, _arg_2, _arg_3, _arg_4);
        }

        public function _Str_2171(k:uint, _arg_2:String, _arg_3:ByteArray=null, _arg_4:Boolean=true):FZipFile
        {
            if (this._Str_1974 == null)
            {
                this._Str_1974 = [];
            }
            if (this._Str_1485 == null)
            {
                this._Str_1485 = new Dictionary();
            }
            else
            {
                if (this._Str_1485[_arg_2])
                {
                    throw (new Error((("File already exists: " + _arg_2) + ". Please remove first.")));
                }
            }
            var _local_5:FZipFile = new FZipFile();
            _local_5.filename = _arg_2;
            _local_5._Str_1657(_arg_3, _arg_4);
            if (k >= this._Str_1974.length)
            {
                this._Str_1974.push(_local_5);
            }
            else
            {
                this._Str_1974.splice(k, 0, _local_5);
            }
            this._Str_1485[_arg_2] = _local_5;
            return _local_5;
        }

        public function _Str_2177(k:uint, _arg_2:String, _arg_3:String, _arg_4:String="utf-8", _arg_5:Boolean=true):FZipFile
        {
            if (this._Str_1974 == null)
            {
                this._Str_1974 = [];
            }
            if (this._Str_1485 == null)
            {
                this._Str_1485 = new Dictionary();
            }
            else
            {
                if (this._Str_1485[_arg_2])
                {
                    throw (new Error((("File already exists: " + _arg_2) + ". Please remove first.")));
                }
            }
            var _local_6:FZipFile = new FZipFile();
            _local_6.filename = _arg_2;
            _local_6._Str_1982(_arg_3, _arg_4, _arg_5);
            if (k >= this._Str_1974.length)
            {
                this._Str_1974.push(_local_6);
            }
            else
            {
                this._Str_1974.splice(k, 0, _local_6);
            }
            this._Str_1485[_arg_2] = _local_6;
            return _local_6;
        }

        public function _Str_1950(k:uint):FZipFile
        {
            var _local_2:FZipFile;
            if ((((!(this._Str_1974 == null)) && (!(this._Str_1485 == null))) && (k < this._Str_1974.length)))
            {
                _local_2 = (this._Str_1974[k] as FZipFile);
                if (_local_2 != null)
                {
                    this._Str_1974.splice(k, 1);
                    delete this._Str_1485[_local_2.filename];
                    return _local_2;
                }
            }
            return null;
        }

        protected function parse(k:IDataInput):Boolean
        {
            do 
            {
            } while (this._Str_675(k));
            return this._Str_675 === this._Str_1922;
        }

        protected function _Str_1922(k:IDataInput):Boolean
        {
            return false;
        }

        protected function _Str_1084(k:IDataInput):Boolean
        {
            var _local_2:uint;
            if (k.bytesAvailable >= 4)
            {
                _local_2 = k.readUnsignedInt();
                switch (_local_2)
                {
                    case _Str_1265:
                        this._Str_675 = this._Str_2081;
                        this._Str_1618 = new FZipFile(this._Str_1902);
                        break;
                    case _Str_1517:
                    case _Str_1758:
                    case _Str_2215:
                    case _Str_2045:
                    case SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:
                    case SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:
                    case _Str_1548:
                    case _Str_1224:
                    case _Str_1080:
                        this._Str_675 = this._Str_1922;
                        break;
                    default:
                        throw (new Error(("Unknown record signature: 0x" + _local_2.toString(16))));
                }
                return true;
            }
            return false;
        }

        protected function _Str_2081(k:IDataInput):Boolean
        {
            if (this._Str_1618.parse(k))
            {
                if (this._Str_1618._Str_1515)
                {
                    this._Str_675 = this._Str_1551;
                    this._Str_2114 = new ByteArray();
                    this._Str_2253 = 0;
                    this._Str_1831 = 0;
                    return true;
                }
                this._Str_1838();
                if (this._Str_675 != this._Str_1922)
                {
                    this._Str_675 = this._Str_1084;
                    return true;
                }
            }
            return false;
        }

        protected function _Str_1551(k:IDataInput):Boolean
        {
            var _local_2:uint;
            while (k.bytesAvailable > 0)
            {
                _local_2 = k.readUnsignedByte();
                this._Str_2253 = ((this._Str_2253 >>> 8) | (_local_2 << 24));
                if (this._Str_2253 == _Str_1548)
                {
                    this._Str_2114.length = (this._Str_2114.length - 3);
                    this._Str_675 = this._Str_2151;
                    return true;
                }
                this._Str_2114.writeByte(_local_2);
            }
            return false;
        }

        protected function _Str_2151(k:IDataInput):Boolean
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint;
            if (k.bytesAvailable >= 12)
            {
                _local_2 = k.readUnsignedInt();
                _local_3 = k.readUnsignedInt();
                _local_4 = k.readUnsignedInt();
                if (this._Str_2114.length == _local_3)
                {
                    this._Str_2114.position = 0;
                    this._Str_1618._Str_1235 = _local_2;
                    this._Str_1618._Str_1796 = _local_3;
                    this._Str_1618._Str_1623 = _local_4;
                    this._Str_1618._Str_1308(this._Str_2114);
                    this._Str_1838();
                    this._Str_675 = this._Str_1084;
                }
                else
                {
                    this._Str_2114.writeUnsignedInt(_local_2);
                    this._Str_2114.writeUnsignedInt(_local_3);
                    this._Str_2114.writeUnsignedInt(_local_4);
                    this._Str_675 = this._Str_1551;
                }
                return true;
            }
            return false;
        }

        protected function _Str_1838():void
        {
            this._Str_1974.push(this._Str_1618);
            if (this._Str_1618.filename)
            {
                this._Str_1485[this._Str_1618.filename] = this._Str_1618;
            }
            dispatchEvent(new _Str_661(_Str_661.FILELOADED, this._Str_1618));
            this._Str_1618 = null;
        }

        protected function _Str_2036(evt:Event):void
        {
            dispatchEvent(evt.clone());
            try
            {
                if (this.parse(this._Str_1578))
                {
                    this.close();
                    dispatchEvent(new Event(Event.COMPLETE));
                }
            }
            catch(e:Error)
            {
                close();
                if (hasEventListener(_Str_897.PARSEERROR))
                {
                    dispatchEvent(new _Str_897(_Str_897.PARSEERROR, e.message));
                }
            }
        }

        protected function _Str_1189(k:Event):void
        {
            dispatchEvent(k.clone());
        }

        protected function _Str_2255(k:Event):void
        {
            this.close();
            dispatchEvent(k.clone());
        }

        protected function _Str_1740():void
        {
            this._Str_1578.addEventListener(Event.COMPLETE, this._Str_1189);
            this._Str_1578.addEventListener(Event.OPEN, this._Str_1189);
            this._Str_1578.addEventListener(HTTPStatusEvent.HTTP_STATUS, this._Str_1189);
            this._Str_1578.addEventListener(IOErrorEvent.IO_ERROR, this._Str_2255);
            this._Str_1578.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this._Str_2255);
            this._Str_1578.addEventListener(ProgressEvent.PROGRESS, this._Str_2036);
        }

        protected function _Str_2076():void
        {
            this._Str_1578.removeEventListener(Event.COMPLETE, this._Str_1189);
            this._Str_1578.removeEventListener(Event.OPEN, this._Str_1189);
            this._Str_1578.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this._Str_1189);
            this._Str_1578.removeEventListener(IOErrorEvent.IO_ERROR, this._Str_2255);
            this._Str_1578.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this._Str_2255);
            this._Str_1578.removeEventListener(ProgressEvent.PROGRESS, this._Str_2036);
        }
    }
}
