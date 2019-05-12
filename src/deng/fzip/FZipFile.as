package deng.fzip
{
    import flash.utils.describeType;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.Endian;
    import deng.utils.ChecksumUtil;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import flash.utils.*;

    public class FZipFile 
    {
        public static const _Str_2181:int = 0;
        public static const _Str_2161:int = 1;
        public static const COMPRESSION_REDUCED_1:int = 2;
        public static const COMPRESSION_REDUCED_2:int = 3;
        public static const COMPRESSION_REDUCED_3:int = 4;
        public static const COMPRESSION_REDUCED_4:int = 5;
        public static const _Str_1207:int = 6;
        public static const _Str_1340:int = 7;
        public static const _Str_1526:int = 8;
        public static const _Str_1967:int = 9;
        public static const _Str_1145:int = 10;
        protected static var _Str_1093:Boolean = (describeType(ByteArray).factory.method.(@name == "uncompress").parameter.length() > 0);
        protected static var _Str_1969:Boolean = (describeType(ByteArray).factory.method.(@name == "inflate").length() > 0);

        protected var _Str_1418:int = 0;
        protected var _Str_2025:String = "2.0";
        protected var _Str_1062:int = 8;
        protected var _Str_1281:Boolean = false;
        protected var _Str_2010:int = -1;
        protected var _Str_1264:int = -1;
        protected var _Str_2043:int = -1;
        protected var _Str_1462:Boolean = false;
        protected var _Str_1258:Boolean = false;
        protected var _Str_1423:Date;
        protected var _Str_1598:uint;
        protected var _Str_1677:Boolean = false;
        protected var _Str_2198:uint = 0;
        protected var _Str_2179:uint = 0;
        protected var _Str_1673:String = "";
        protected var _Str_1804:String;
        protected var _Str_1617:Dictionary;
        protected var _Str_2165:String = "";
        protected var _content:ByteArray;
        internal var _Str_1235:uint;
        internal var _Str_1796:uint = 0;
        internal var _Str_1623:uint = 0;
        protected var _Str_1864:Boolean = false;
        protected var _Str_675:Function;

        public function FZipFile(k:String="utf-8")
        {
            this._Str_675 = this._Str_1727;
            super();
            this._Str_1804 = k;
            this._Str_1617 = new Dictionary();
            this._content = new ByteArray();
            this._content.endian = Endian.BIG_ENDIAN;
        }

        public function get date():Date
        {
            return this._Str_1423;
        }

        public function set date(k:Date):void
        {
            this._Str_1423 = ((k != null) ? k : new Date());
        }

        public function get filename():String
        {
            return this._Str_1673;
        }

        public function set filename(k:String):void
        {
            this._Str_1673 = k;
        }

        internal function get _Str_1515():Boolean
        {
            return this._Str_1462;
        }

        public function get content():ByteArray
        {
            if (this._Str_1864)
            {
                this.uncompress();
            }
            return this._content;
        }

        public function set content(k:ByteArray):void
        {
            this._Str_1657(k);
        }

        public function _Str_1657(k:ByteArray, _arg_2:Boolean=true):void
        {
            if (((!(k == null)) && (k.length > 0)))
            {
                k.position = 0;
                k.readBytes(this._content, 0, k.length);
                this._Str_1235 = ChecksumUtil._Str_1999(this._content);
                this._Str_1677 = false;
            }
            else
            {
                this._content.length = 0;
                this._content.position = 0;
                this._Str_1864 = false;
            }
            if (_arg_2)
            {
                this.compress();
            }
            else
            {
                this._Str_1623 = (this._Str_1796 = this._content.length);
            }
        }

        public function get _Str_1639():String
        {
            return this._Str_2025;
        }

        public function get _Str_1508():uint
        {
            return this._Str_1796;
        }

        public function get _Str_1318():uint
        {
            return this._Str_1623;
        }

        public function _Str_1112(k:Boolean=true, _arg_2:String="utf-8"):String
        {
            var _local_3:String;
            if (this._Str_1864)
            {
                this.uncompress();
            }
            this._content.position = 0;
            if (_arg_2 == "utf-8")
            {
                _local_3 = this._content.readUTFBytes(this._content.bytesAvailable);
            }
            else
            {
                _local_3 = this._content.readMultiByte(this._content.bytesAvailable, _arg_2);
            }
            this._content.position = 0;
            if (k)
            {
                this.compress();
            }
            return _local_3;
        }

        public function _Str_1982(k:String, _arg_2:String="utf-8", _arg_3:Boolean=true):void
        {
            this._content.length = 0;
            this._content.position = 0;
            this._Str_1864 = false;
            if (((!(k == null)) && (k.length > 0)))
            {
                if (_arg_2 == "utf-8")
                {
                    this._content.writeUTFBytes(k);
                }
                else
                {
                    this._content.writeMultiByte(k, _arg_2);
                }
                this._Str_1235 = ChecksumUtil._Str_1999(this._content);
                this._Str_1677 = false;
            }
            if (_arg_3)
            {
                this.compress();
            }
            else
            {
                this._Str_1623 = (this._Str_1796 = this._content.length);
            }
        }

        public function _Str_1294(k:IDataOutput, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:uint=0):uint
        {
            var _local_10:Object;
            var _local_15:ByteArray;
            var _local_16:Boolean;
            if (k == null)
            {
                return 0;
            }
            if (_arg_3)
            {
                k.writeUnsignedInt(FZip._Str_1517);
                k.writeShort(((this._Str_1418 << 8) | 0x14));
            }
            else
            {
                k.writeUnsignedInt(FZip._Str_1265);
            }
            k.writeShort(((this._Str_1418 << 8) | 0x14));
            k.writeShort(((this._Str_1804 == "utf-8") ? 0x0800 : 0));
            k.writeShort(((this._Str_1864) ? _Str_1526 : _Str_2181));
            var _local_5:Date = ((this._Str_1423 != null) ? this._Str_1423 : new Date());
            var _local_6:uint = ((uint(_local_5.getSeconds()) | (uint(_local_5.getMinutes()) << 5)) | (uint(_local_5.getHours()) << 11));
            var _local_7:uint = ((uint(_local_5.getDate()) | (uint((_local_5.getMonth() + 1)) << 5)) | (uint((_local_5.getFullYear() - 1980)) << 9));
            k.writeShort(_local_6);
            k.writeShort(_local_7);
            k.writeUnsignedInt(this._Str_1235);
            k.writeUnsignedInt(this._Str_1796);
            k.writeUnsignedInt(this._Str_1623);
            var _local_8:ByteArray = new ByteArray();
            _local_8.endian = Endian.LITTLE_ENDIAN;
            if (this._Str_1804 == "utf-8")
            {
                _local_8.writeUTFBytes(this._Str_1673);
            }
            else
            {
                _local_8.writeMultiByte(this._Str_1673, this._Str_1804);
            }
            var _local_9:uint = _local_8.position;
            for (_local_10 in this._Str_1617)
            {
                _local_15 = (this._Str_1617[_local_10] as ByteArray);
                if (_local_15 != null)
                {
                    _local_8.writeShort(uint(_local_10));
                    _local_8.writeShort(uint(_local_15.length));
                    _local_8.writeBytes(_local_15);
                }
            }
            if (_arg_2)
            {
                if (!this._Str_1677)
                {
                    _local_16 = this._Str_1864;
                    if (_local_16)
                    {
                        this.uncompress();
                    }
                    this._Str_1598 = ChecksumUtil._Str_1386(this._content, 0, this._content.length);
                    this._Str_1677 = true;
                    if (_local_16)
                    {
                        this.compress();
                    }
                }
                _local_8.writeShort(0xDADA);
                _local_8.writeShort(4);
                _local_8.writeUnsignedInt(this._Str_1598);
            }
            var _local_11:uint = (_local_8.position - _local_9);
            if (((_arg_3) && (this._Str_2165.length > 0)))
            {
                if (this._Str_1804 == "utf-8")
                {
                    _local_8.writeUTFBytes(this._Str_2165);
                }
                else
                {
                    _local_8.writeMultiByte(this._Str_2165, this._Str_1804);
                }
            }
            var _local_12:uint = ((_local_8.position - _local_9) - _local_11);
            k.writeShort(_local_9);
            k.writeShort(_local_11);
            if (_arg_3)
            {
                k.writeShort(_local_12);
                k.writeShort(0);
                k.writeShort(0);
                k.writeUnsignedInt(0);
                k.writeUnsignedInt(_arg_4);
            }
            if (((_local_9 + _local_11) + _local_12) > 0)
            {
                k.writeBytes(_local_8);
            }
            var _local_13:uint;
            if (((!(_arg_3)) && (this._content.length > 0)))
            {
                if (this._Str_1864)
                {
                    if (((_Str_1093) || (_Str_1969)))
                    {
                        _local_13 = this._content.length;
                        k.writeBytes(this._content, 0, _local_13);
                    }
                    else
                    {
                        _local_13 = (this._content.length - 6);
                        k.writeBytes(this._content, 2, _local_13);
                    }
                }
                else
                {
                    _local_13 = this._content.length;
                    k.writeBytes(this._content, 0, _local_13);
                }
            }
            var _local_14:uint = ((((30 + _local_9) + _local_11) + _local_12) + _local_13);
            if (_arg_3)
            {
                _local_14 = (_local_14 + 16);
            }
            return _local_14;
        }

        internal function parse(k:IDataInput):Boolean
        {
            do 
            {
            } while (((k.bytesAvailable) && (this._Str_675(k))));
            return this._Str_675 === this._Str_1678;
        }

        protected function _Str_1678(k:IDataInput):Boolean
        {
            return false;
        }

        protected function _Str_1727(k:IDataInput):Boolean
        {
            if (k.bytesAvailable >= 30)
            {
                this._Str_1627(k);
                if ((this._Str_2198 + this._Str_2179) > 0)
                {
                    this._Str_675 = this._Str_1338;
                }
                else
                {
                    this._Str_675 = this._Str_1903;
                }
                return true;
            }
            return false;
        }

        protected function _Str_1338(k:IDataInput):Boolean
        {
            if (k.bytesAvailable >= (this._Str_2198 + this._Str_2179))
            {
                this._Str_1589(k);
                this._Str_675 = this._Str_1903;
                return true;
            }
            return false;
        }

        protected function _Str_1903(k:IDataInput):Boolean
        {
            var _local_2:Boolean = true;
            if (this._Str_1462)
            {
                this._Str_675 = this._Str_1678;
                _local_2 = false;
            }
            else
            {
                if (this._Str_1796 == 0)
                {
                    this._Str_675 = this._Str_1678;
                }
                else
                {
                    if (k.bytesAvailable >= this._Str_1796)
                    {
                        this._Str_1308(k);
                        this._Str_675 = this._Str_1678;
                    }
                    else
                    {
                        _local_2 = false;
                    }
                }
            }
            return _local_2;
        }

        protected function _Str_1627(k:IDataInput):void
        {
            var _local_2:uint = k.readUnsignedShort();
            this._Str_1418 = (_local_2 >> 8);
            this._Str_2025 = ((Math.floor(((_local_2 & 0xFF) / 10)) + ".") + ((_local_2 & 0xFF) % 10));
            var _local_3:uint = k.readUnsignedShort();
            this._Str_1062 = k.readUnsignedShort();
            this._Str_1281 = (!((_local_3 & 0x01) === 0));
            this._Str_1462 = (!((_local_3 & 0x08) === 0));
            this._Str_1258 = (!((_local_3 & 0x20) === 0));
            if ((_local_3 & 0x0320) !== 0)
            {
                this._Str_1804 = "utf-8";
            }
            if (this._Str_1062 === _Str_1207)
            {
                this._Str_2010 = (((_local_3 & 0x02) !== 0) ? 0x2000 : 0x1000);
                this._Str_1264 = (((_local_3 & 0x04) !== 0) ? 3 : 2);
            }
            else
            {
                if (this._Str_1062 === _Str_1526)
                {
                    this._Str_2043 = ((_local_3 & 0x06) >> 1);
                }
            }
            var _local_4:uint = k.readUnsignedShort();
            var _local_5:uint = k.readUnsignedShort();
            var _local_6:* = (_local_4 & 0x1F);
            var _local_7:* = ((_local_4 & 0x07E0) >> 5);
            var _local_8:* = ((_local_4 & 0xF800) >> 11);
            var _local_9:* = (_local_5 & 0x1F);
            var _local_10:* = ((_local_5 & 0x01E0) >> 5);
            var _local_11:int = (((_local_5 & 0xFE00) >> 9) + 1980);
            this._Str_1423 = new Date(_local_11, (_local_10 - 1), _local_9, _local_8, _local_7, _local_6, 0);
            this._Str_1235 = k.readUnsignedInt();
            this._Str_1796 = k.readUnsignedInt();
            this._Str_1623 = k.readUnsignedInt();
            this._Str_2198 = k.readUnsignedShort();
            this._Str_2179 = k.readUnsignedShort();
        }

        protected function _Str_1589(k:IDataInput):void
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:ByteArray;
            if (this._Str_1804 == "utf-8")
            {
                this._Str_1673 = k.readUTFBytes(this._Str_2198);
            }
            else
            {
                this._Str_1673 = k.readMultiByte(this._Str_2198, this._Str_1804);
            }
            var _local_2:uint = this._Str_2179;
            while (_local_2 > 4)
            {
                _local_3 = k.readUnsignedShort();
                _local_4 = k.readUnsignedShort();
                if (_local_4 > _local_2)
                {
                    throw (new Error((("Parse error in file " + this._Str_1673) + ": Extra field data size too big.")));
                }
                if (((_local_3 === 0xDADA) && (_local_4 === 4)))
                {
                    this._Str_1598 = k.readUnsignedInt();
                    this._Str_1677 = true;
                }
                else
                {
                    if (_local_4 > 0)
                    {
                        _local_5 = new ByteArray();
                        k.readBytes(_local_5, 0, _local_4);
                        this._Str_1617[_local_3] = _local_5;
                    }
                }
                _local_2 = (_local_2 - (_local_4 + 4));
            }
            if (_local_2 > 0)
            {
                k.readBytes(new ByteArray(), 0, _local_2);
            }
        }

        internal function _Str_1308(k:IDataInput):void
        {
            var _local_2:uint;
            if (((this._Str_1062 === _Str_1526) && (!(this._Str_1281))))
            {
                if (((_Str_1093) || (_Str_1969)))
                {
                    k.readBytes(this._content, 0, this._Str_1796);
                }
                else
                {
                    if (this._Str_1677)
                    {
                        this._content.writeByte(120);
                        _local_2 = (((~(this._Str_2043)) << 6) & 0xC0);
                        _local_2 = (_local_2 + (31 - (((120 << 8) | _local_2) % 31)));
                        this._content.writeByte(_local_2);
                        k.readBytes(this._content, 2, this._Str_1796);
                        this._content.position = this._content.length;
                        this._content.writeUnsignedInt(this._Str_1598);
                    }
                    else
                    {
                        throw (new Error("Adler32 checksum not found."));
                    }
                }
                this._Str_1864 = true;
            }
            else
            {
                if (this._Str_1062 == _Str_2181)
                {
                    k.readBytes(this._content, 0, this._Str_1796);
                    this._Str_1864 = false;
                }
                else
                {
                    throw (new Error((("Compression method " + this._Str_1062) + " is not supported.")));
                }
            }
            this._content.position = 0;
        }

        protected function compress():void
        {
            if (!this._Str_1864)
            {
                if (this._content.length > 0)
                {
                    this._content.position = 0;
                    this._Str_1623 = this._content.length;
                    if (_Str_1969)
                    {
                        this._content.deflate();
                        this._Str_1796 = this._content.length;
                    }
                    else
                    {
                        if (_Str_1093)
                        {
                            this._content.compress.apply(this._content, ["deflate"]);
                            this._Str_1796 = this._content.length;
                        }
                        else
                        {
                            this._content.compress();
                            this._Str_1796 = (this._content.length - 6);
                        }
                    }
                    this._content.position = 0;
                    this._Str_1864 = true;
                }
                else
                {
                    this._Str_1796 = 0;
                    this._Str_1623 = 0;
                }
            }
        }

        protected function uncompress():void
        {
            if (((this._Str_1864) && (this._content.length > 0)))
            {
                this._content.position = 0;
                if (_Str_1969)
                {
                    this._content.inflate();
                }
                else
                {
                    if (_Str_1093)
                    {
                        this._content.uncompress.apply(this._content, ["deflate"]);
                    }
                    else
                    {
                        this._content.uncompress();
                    }
                }
                this._content.position = 0;
                this._Str_1864 = false;
            }
        }

        public function toString():String
        {
            return ((((((((((((((((((((((((("[FZipFile]" + "\n  name:") + this._Str_1673) + "\n  date:") + this._Str_1423) + "\n  sizeCompressed:") + this._Str_1796) + "\n  sizeUncompressed:") + this._Str_1623) + "\n  versionHost:") + this._Str_1418) + "\n  versionNumber:") + this._Str_2025) + "\n  compressionMethod:") + this._Str_1062) + "\n  encrypted:") + this._Str_1281) + "\n  hasDataDescriptor:") + this._Str_1462) + "\n  hasCompressedPatchedData:") + this._Str_1258) + "\n  filenameEncoding:") + this._Str_1804) + "\n  crc32:") + this._Str_1235.toString(16)) + "\n  adler32:") + this._Str_1598.toString(16);
        }
    }
}
