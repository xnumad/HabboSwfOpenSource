package com.sulake.core.assets
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.LibraryLoader;
    import deng.fzip.FZip;
    import com.sulake.core.assets.loaders.BinaryFileLoader;
    import com.sulake.core.assets.loaders.BitmapFileLoader;
    import com.sulake.core.assets.loaders.ZipFileLoader;
    import com.sulake.core.assets.loaders.TextFileLoader;
    import com.sulake.core.assets.loaders.SoundFileLoader;
    import deng.fzip.FZipFile;
    import flash.system.System;
    import flash.events.Event;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.loaders.IAssetLoader;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.net.URLRequest;
    import flash.events.ProgressEvent;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.assets.loaders.*;

    public class AssetLibrary extends EventDispatcherWrapper implements IAssetLibrary 
    {
        public static const ASSET_LIBRARY_READY:String = "AssetLibraryReady";
        public static const ASSET_LIBRARY_LOADED:String = "AssetLibraryLoaded";
        public static const ASSET_LIBRARY_UNLOADED:String = "AssetLibraryUnloaded";
        public static const ASSET_LIBRARY_LOAD_ERROR:String = "AssetLibraryLoadError";
        private static const NAME:String = "name";
        private static const ASSET:String = "asset";
        private static const PARAM:String = "param";
        private static const TYPE:String = "mimeType";
        private static const LIB:String = "library";
        private static const REF:String = "ref";
        private static var _sharedListOfTypesByMime:Dictionary;
        private static var _lazyAssetProcessor:LazyAssetProcessor = new LazyAssetProcessor();
        private static const USE_LAZY_ASSET_PROCESSOR:Boolean = false;
        private static var _numAssetLibraryInstances:uint = 0;
        private static var _assetLibraryRefArray:Array = new Array();

        private var _name:String;
        private var _file:String;
        private var _manifest:XML;
        private var _isReady:Boolean;
        private var _numAssets:uint;
        private var _loader:LibraryLoader;
        private var _resource:Class;
        private var _zipLoader:FZip;
        private var _loadedClasses:Dictionary;
        private var _loadedAssets:Dictionary;
        private var _prepareAssets:Boolean = true;
        private var _assetLoaderStructs:Dictionary;
        private var _assetNameArray:Array;
        private var _localListOfTypesByMime:Dictionary;

        public function AssetLibrary(name:String, manifest:XML=null)
        {
            this._name = name;
            this._manifest = manifest;
            this._numAssets = 0;
            this._assetNameArray = new Array();
            if (_sharedListOfTypesByMime == null)
            {
                _sharedListOfTypesByMime = new Dictionary(false);
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/octet-stream", UnknownAsset, BinaryFileLoader));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-shockwave-flash", DisplayAsset, BitmapFileLoader, "swf"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-font-truetype", TypeFaceAsset, BinaryFileLoader, "ttf", "otf"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/zip", UnknownAsset, ZipFileLoader, "zip"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/xml", XmlAsset, TextFileLoader, "xml"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/html", XmlAsset, TextFileLoader, "htm", "html"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/plain", TextAsset, TextFileLoader, "txt"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/jpeg", BitmapDataAsset, BitmapFileLoader, "jpg", "jpeg"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/gif", BitmapDataAsset, BitmapFileLoader, "gif"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/png", BitmapDataAsset, BitmapFileLoader, "png"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/tiff", BitmapDataAsset, BitmapFileLoader, "tif", "tiff"));
                this.registerAssetTypeDeclaration(new AssetTypeDeclaration("sound/mp3", SoundAsset, SoundFileLoader, "mp3"));
            }
            _numAssetLibraryInstances++;
            this._localListOfTypesByMime = new Dictionary(false);
            this._assetLoaderStructs = new Dictionary(false);
            this._loadedClasses = new Dictionary(false);
            this._loadedAssets = new Dictionary(false);
            _assetLibraryRefArray.push(this);
        }

        public static function get numAssetLibraryInstances():uint
        {
            return _numAssetLibraryInstances;
        }

        public static function get assetLibraryRefArray():Array
        {
            return _assetLibraryRefArray;
        }

        private static function fetchLibraryContents(k:AssetLibrary, _arg_2:XML, _arg_3:Class, _arg_4:FZip=null):Boolean
        {
            var _local_6:XMLList;
            var _local_7:XML;
            var _local_8:String;
            var _local_9:String;
            var _local_10:AssetTypeDeclaration;
            var _local_11:IAsset;
            var _local_12:XMLList;
            var _local_13:int;
            var _local_14:AssetTypeDeclaration;
            var _local_16:String;
            var _local_17:FZipFile;
            if (((_arg_3 == null) && (_arg_4 == null)))
            {
                throw (new Error((("Library " + k._file) + " doesn't contain valid resource class!")));
            }
            var _local_5:XMLList = _arg_2.child(LIB);
            if (_local_5 == null)
            {
                throw (Error("Provided manifest doesn't contain library node!"));
            }
            var _local_15:String;
            _local_6 = _local_5[0].assets;
            if (_local_6 != null)
            {
                _local_6 = _local_6.child(ASSET);
                _local_13 = _local_6.length();
                for each (_local_7 in _local_6)
                {
                    _local_8 = _local_7.attribute(NAME);
                    _local_9 = _local_7.attribute(TYPE);
                    if (_local_9 == _local_15)
                    {
                        _local_10 = _local_14;
                    }
                    else
                    {
                        _local_10 = k.getAssetTypeDeclarationByMimeType(_local_9);
                        _local_15 = _local_9;
                        _local_14 = _local_10;
                    }
                    if (_local_10 != null)
                    {
                        _local_11 = (new (_local_10.assetClass)(_local_10) as IAsset);
                        if (((!(_arg_4 == null)) && (_arg_4._Str_1455() > 0)))
                        {
                            _local_16 = ".png";
                            if ((_local_11 is BitmapDataAsset))
                            {
                                _local_16 = ".png";
                            }
                            if ((_local_11 is XmlAsset))
                            {
                                _local_16 = ".xml";
                            }
                            _local_17 = _arg_4._Str_1843((_local_8 + _local_16));
                            if (_local_17)
                            {
                                _local_11.setUnknownContent(_local_17.content);
                            }
                        }
                        else
                        {
                            _local_11.setUnknownContent(_arg_3[_local_8]);
                        }
                        _local_12 = _local_7.child(PARAM);
                        if (_local_12.length())
                        {
                            _local_11.setParamsDesc(_local_12);
                        }
                        k.setAsset(_local_8, _local_11);
                    }
                }
            }
            _local_6 = _local_5[0].aliases;
            if (_local_6 != null)
            {
                _local_6 = _local_6.child(ASSET);
                for each (_local_7 in _local_6)
                {
                    _local_8 = _local_7.attribute(NAME);
                    _local_9 = _local_7.attribute(TYPE);
                    if (_local_9 == _local_15)
                    {
                        _local_10 = _local_14;
                    }
                    else
                    {
                        _local_10 = k.getAssetTypeDeclarationByMimeType(_local_9);
                        _local_15 = _local_9;
                        _local_14 = _local_10;
                    }
                    if (_local_10 != null)
                    {
                        _local_11 = (new (_local_10.assetClass)(_local_10) as IAsset);
                        _local_11.setUnknownContent(k.getAssetByName(_local_7.attribute(REF)).content);
                        _local_12 = _local_7.child(PARAM);
                        if (_local_12.length())
                        {
                            _local_11.setParamsDesc(_local_12);
                        }
                        k.setAsset(_local_8, _local_11);
                    }
                }
            }
            return true;
        }


        public function get url():String
        {
            return this._file;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get isReady():Boolean
        {
            return this._isReady;
        }

        public function get manifest():XML
        {
            return (this._manifest) ? this._manifest : this._manifest = new XML();
        }

        public function get numAssets():uint
        {
            return this._numAssets;
        }

        public function get nameArray():Array
        {
            return this._assetNameArray;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this.unload();
                super.dispose();
                _assetLibraryRefArray.splice(_assetLibraryRefArray.indexOf(this), 1);
                _numAssetLibraryInstances--;
                this._assetLoaderStructs = null;
                this._loadedClasses = null;
                this._loadedAssets = null;
                this._assetNameArray = null;
                System.disposeXML(this._manifest);
                this._manifest = null;
                this._numAssets = 0;
                this._isReady = false;
                this._name = null;
            }
        }

        public function loadFromFile(libraryLoader:LibraryLoader, prepareAssets:Boolean=true):void
        {
            if (((this._file == libraryLoader.url) && (this._isReady)))
            {
                if (((!(this._prepareAssets)) && (prepareAssets)))
                {
                    AssetLibrary.fetchLibraryContents(this, this._manifest, this._resource);
                }
                this._prepareAssets = prepareAssets;
                dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_READY));
            }
            else
            {
                if (((this._loader == null) || (this._loader.disposed)))
                {
                    this._loader = libraryLoader;
                    this._loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.libraryLoadedHandler);
                    this._loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadErrorHandler);
                }
                this._prepareAssets = prepareAssets;
                this._file = this._loader.url;
            }
        }

        public function loadFromResource(xml:XML, type:Class):Boolean
        {
            return AssetLibrary.fetchLibraryContents(this, xml, type);
        }

        public function unload():void
        {
            for (var name:String in this._assetLoaderStructs)
            {
                var loaderStruct:AssetLoaderStruct = this._assetLoaderStructs[name];
                loaderStruct.assetLoader.dispose();
                delete this._assetLoaderStructs[name];
            }
            for (name in this._loadedAssets)
            {
                var asset:IAsset = this._loadedAssets[name];
                asset.dispose();
                delete this._loadedAssets[name];
            }
            for (name in this._loadedClasses)
            {
                delete this._loadedClasses[name];
            }
            if (this._loader != null)
            {
                this._loader.dispose();
                this._loader = null;
            }
            this._numAssets = 0;
            this._isReady = false;
            this._file = null;
            dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_UNLOADED));
        }

        public function getClass(name:String):Class
        {
            var result:Class = this._loadedClasses[name];
            if (result != null)
            {
                return result;
            }
            if (this._loader != null)
            {
                if (this._loader.hasDefinition(name))
                {
                    result = (this._loader.getDefinition(name) as Class);
                    if (result != null)
                    {
                        this._loadedClasses[name] = result;
                        return result;
                    }
                }
            }
            return null;
        }

        public function loadAssetFromFile(name:String, urlRequest:URLRequest, type:String=null, _arg_4:String=null, _arg_5:int=-1, _arg_6:int=-1):AssetLoaderStruct
        {
            var typeDeclaration:AssetTypeDeclaration;
            if (this.getAssetByName(name) != null)
            {
                throw (new Error((("Asset with name " + name) + " already exists!")));
            }
            var loaderStruct:AssetLoaderStruct = this._assetLoaderStructs[urlRequest.url];
            if (loaderStruct != null)
            {
                if (loaderStruct.assetName == name)
                {
                    return loaderStruct;
                }
            }
            if (type == null)
            {
                typeDeclaration = this.solveAssetTypeDeclarationFromUrl(urlRequest.url);
                if (typeDeclaration == null)
                {
                    throw (new Error((("Couldn't solve asset type for file " + urlRequest.url) + "!")));
                }
            }
            else
            {
                typeDeclaration = this.getAssetTypeDeclarationByMimeType(type, true);
                if (typeDeclaration == null)
                {
					Habbo.trackLoginStep(("Asset type declaration for mime type " + type) + "not found!");
                    throw (new Error((("Asset type declaration for mime type " + type) + "not found!")));
                }
            }
            var content:ByteArray
            var loader:IAssetLoader = new (typeDeclaration.loaderClass)(typeDeclaration.mimeType, urlRequest, _arg_4, _arg_5, content, _arg_6);
            if (loader == null)
            {
				Habbo.trackLoginStep(("Invalid file loader class defined for mime type " + type) + "!");
                throw (new Error((("Invalid file loader class defined for mime type " + type) + "!")));
            }
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.assetLoadEventHandler);
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.assetLoadEventHandler);
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTUNLOAD, this.assetLoadEventHandler);
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTPROGRESS, this.assetLoadEventHandler);
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTSTATUS, this.assetLoadEventHandler);
            loader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTOPEN, this.assetLoadEventHandler);
            loaderStruct = new AssetLoaderStruct(name, loader);
            this._assetLoaderStructs[urlRequest.url] = loaderStruct;
            return loaderStruct;
        }

        private function assetLoadEventHandler(event:AssetLoaderEvent):void
        {
			try
			{
				var loader:IAssetLoader;
				var type:String;
				var decl:AssetTypeDeclaration;
				var asset:IAsset;
				var remove:Boolean;
				if (event.target == null)
				{
					Habbo.trackLoginStep("Asset Library: AssetLoaderEvent.target is null!");
				}
				loader = (event.target as IAssetLoader);
				if (loader == null)
				{
					Habbo.trackLoginStep("Asset Library: Failed to downcast object to asset loader!");
					throw (new Error("Failed to downcast object to asset loader!"));
				}
				var struct:AssetLoaderStruct = this._assetLoaderStructs[loader.url];
				if (struct == null)
				{
					Habbo.trackLoginStep("Asset Library: Asset loader structure was lost! " + ((loader) ? loader.url : ""));
					throw (new Error(("Asset loader structure was lost! " + ((loader) ? loader.url : ""))));
				}
				switch (event.type)
				{
					case AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE:
						type = loader.mimeType;
						decl = this.getAssetTypeDeclarationByMimeType(type);
						remove = true;
						if (decl != null)
						{
							asset = new (decl.assetClass)(decl, loader.url);
							try
							{
								asset.setUnknownContent(loader.content);
							}
							catch(error:Error)
							{
								Habbo.trackLoginStep("AssetLibary: Error loading context" + error.message + "|" + error.getStackTrace());
								asset.dispose();
								event = new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTERROR, event.status);
								break;
							}
							if (this._loadedAssets[struct.assetName] == null)
							{
								this._numAssets++;
								this._assetNameArray.push(struct.assetName);
							}
							this._loadedAssets[struct.assetName] = asset;
						}
						else
						{
							event = new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTERROR, event.status);
						}
						break;
					case AssetLoaderEvent.ASSETLOADEREVENTERROR:
						remove = true;
						break;
				}
				struct.dispatchEvent(new AssetLoaderEvent(event.type, event.status));
				if (remove)
				{
					try
					{
					if (((!(_disposed)) && (loader)))
					{
						delete this._assetLoaderStructs[loader.url];
					}
					if (struct)
					{
						struct.dispose();
					}
					}
					catch (error: Error)
					{
						Habbo.trackLoginStep("AssetLibrary: Error disposing" + error.message + "|" + error.getStackTrace());
					}
				}
			}
			catch (error:Error)
			{
				Habbo.trackLoginStep("Failed to load " + event.toString() + "|" + event.target + "|" + event.status)
			}
        }

        public function getAssetByName(name:String):IAsset
        {
            var asset:IAsset = this._loadedAssets[name];
            if (asset != null)
            {
                return asset;
            }
            if (this._prepareAssets)
            {
                return null;
            }
            return this.fetchAssetFromResource(name);
        }

        public function getAssetByIndex(index:uint):IAsset
        {
            return (index < this._assetNameArray.length) ? this.getAssetByName(this._assetNameArray[index]) : null;
        }

        public function getAssetByContent(content:Object):IAsset
        {
            for (var key:String in this._loadedAssets)
            {
                var asset:IAsset = this._loadedAssets[key];
                if (asset.content === content)
                {
                    return asset;
                }
            }
            return null;
        }

        public function getAssetIndex(asset:IAsset):int
        {
            for (var key:String in this._loadedAssets)
            {
                if (this._loadedAssets[key] == asset)
                {
                    return this._assetNameArray.indexOf(key);
                }
            }
            return -1;
        }

        public function hasAsset(k:String):Boolean
        {
            return (!(this._loadedAssets[k] == null)) || ((this._resource != null) ? (!(this._resource[k] == null)) : false);
        }

        public function setAsset(name:String, asset:IAsset, _arg_3:Boolean=true):Boolean
        {
            var _local_4:* = (this._loadedAssets[name] == null);
            if ((((_arg_3) || (_local_4)) && (asset)))
            {
                if (_local_4)
                {
                    this._numAssets++;
                    this._assetNameArray.push(name);
                }
                this._loadedAssets[name] = asset;
                if (USE_LAZY_ASSET_PROCESSOR)
                {
                    if ((asset is ILazyAsset))
                    {
                        _lazyAssetProcessor.push((asset as ILazyAsset));
                    }
                }
                return true;
            }
            return false;
        }

        public function createAsset(name:String, type:AssetTypeDeclaration):IAsset
        {
            if (((this.hasAsset(name)) || (!(type))))
            {
                return null;
            }
            var asset:IAsset = new (type.assetClass)(type);
            if (!this.setAsset(name, asset))
            {
                asset.dispose();
                asset = null;
            }
            return asset;
        }

        public function removeAsset(asset:IAsset):IAsset
        {
            if (asset)
            {
                for (var key:String in this._loadedAssets)
                {
                    if (this._loadedAssets[key] == asset)
                    {
                        this._assetNameArray.splice(this._assetNameArray.indexOf(key), 1);
                        delete this._loadedAssets[key];
                        this._numAssets--;
                        return asset;
                    }
                }
            }
            return null;
        }

        public function registerAssetTypeDeclaration(type:AssetTypeDeclaration, shared:Boolean=true):Boolean
        {
            if (shared)
            {
                if (_sharedListOfTypesByMime.hasOwnProperty(type.mimeType))
                {
					Habbo.trackLoginStep("Asset Library: Asset type " + type.mimeType + " already registered!");
                    throw (new Error((("Asset type " + type.mimeType) + " already registered!")));
                }
                _sharedListOfTypesByMime[type.mimeType] = type;
            }
            else
            {
                if (this._localListOfTypesByMime.hasOwnProperty(type.mimeType))
                {
					Habbo.trackLoginStep("Asset Library: Asset type " + type.mimeType + " already registered!");
                    throw (new Error((("Asset type " + type.mimeType) + " already registered!")));
                }
                this._localListOfTypesByMime[type.mimeType] = type;
            }
            return true;
        }

        public function getAssetTypeDeclarationByMimeType(type:String, shared:Boolean=true):AssetTypeDeclaration
        {
            if (shared)
            {
                var typeDeclaration:AssetTypeDeclaration = AssetTypeDeclaration(_sharedListOfTypesByMime[type]);
                if (typeDeclaration != null)
                {
                    return typeDeclaration;
                }
            }
            return AssetTypeDeclaration(this._localListOfTypesByMime[type]);
        }

        public function getAssetTypeDeclarationByClass(typeClass:Class, shared:Boolean=true):AssetTypeDeclaration
        {
            var typeDeclaration:AssetTypeDeclaration;
            var type:String;
            if (shared)
            {
                for (type in _sharedListOfTypesByMime)
                {
                    typeDeclaration = AssetTypeDeclaration(_sharedListOfTypesByMime[type]);
                    if (typeDeclaration != null)
                    {
                        if (typeDeclaration.assetClass == typeClass)
                        {
                            return typeDeclaration;
                        }
                    }
                }
            }
            for (type in this._localListOfTypesByMime)
            {
                typeDeclaration = AssetTypeDeclaration(this._localListOfTypesByMime[type]);
                if (typeDeclaration != null)
                {
                    if (typeDeclaration.assetClass == typeClass)
                    {
                        return typeDeclaration;
                    }
                }
            }
			
            return null;
        }

        public function getAssetTypeDeclarationByFileName(fileName:String, shared:Boolean=true):AssetTypeDeclaration
        {
            var typeDeclaration:AssetTypeDeclaration;
            var type:String;
            var name:String = fileName.substr((fileName.lastIndexOf(".") + 1), fileName.length);
            if (name.indexOf("?"))
            {
                name = name.substr(0, (name.indexOf("?") - 1));
            }
            if (shared)
            {
                for (type in _sharedListOfTypesByMime)
                {
                    typeDeclaration = AssetTypeDeclaration(_sharedListOfTypesByMime[type]);
                    if (typeDeclaration != null)
                    {
                        if (typeDeclaration.fileTypes.indexOf(name))
                        {
                            return typeDeclaration;
                        }
                    }
                }
            }
            for (type in this._localListOfTypesByMime)
            {
                typeDeclaration = AssetTypeDeclaration(this._localListOfTypesByMime[type]);
                if (typeDeclaration != null)
                {
                    if (typeDeclaration.fileTypes.indexOf(name))
                    {
                        return typeDeclaration;
                    }
                }
            }
            return null;
        }

        private function libraryLoadedHandler(event:LibraryLoaderEvent):void
        {
            var loader:LibraryLoader = (event.target as LibraryLoader);
            if (loader.manifest == null)
            {
				Habbo.trackLoginStep("loader.manifest was null, which would have caused error 1009 anyway. See HL-22347.");
                throw (new Error("loader.manifest was null, which would have caused error 1009 anyway. See HL-22347."));
            }
            this._manifest = loader.manifest.copy();
            this._resource = loader.resource;
            this._zipLoader = loader.zipLoader;
            this._file = loader.url;
            if (this._prepareAssets)
            {
                AssetLibrary.fetchLibraryContents(this, this._manifest, this._resource, this._zipLoader);
            }
            this._isReady = true;
            dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_LOADED));
            dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_READY));
            if (this._prepareAssets)
            {
                this._loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.libraryLoadedHandler);
                this._loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadErrorHandler);
                this._loader.addEventListener(LibraryLoader.LIBRARY_LOADER_FINALIZE, this.finalizeLoaderEventHandler);
                this._loader = null;
                this._resource = null;
            }
        }

        private function finalizeLoaderEventHandler(event:Event):void
        {
            var loader:LibraryLoader = (event.target as LibraryLoader);
            if (((loader) && (!(loader.disposed))))
            {
                if (!loader.hasEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE))
                {
                    loader.removeEventListener(LibraryLoader.LIBRARY_LOADER_FINALIZE, this.finalizeLoaderEventHandler);
                    loader.dispose();
                }
            }
        }

        private function onLoadProgress(event:ProgressEvent):void
        {
            dispatchEvent(event.clone());
        }

        private function loadErrorHandler(event:LibraryLoaderEvent):void
        {
            this._isReady = false;
            var loader:LibraryLoader = (event.target as LibraryLoader);
            //var _local_3:String = ((loader) ? loader.name : "unknown");
            dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_LOAD_ERROR));
			Habbo.trackLoginStep("AssetLibrary:loadErrorHandler: " + this._name + ": " + event.target)
            this._loader = null;
        }

        private function solveAssetTypeDeclarationFromUrl(url:String):AssetTypeDeclaration
        {
            var fileTypes:Array;
            var index:int;
            index = url.indexOf("?", 0);
            if (index > 0)
            {
                url = url.slice(0, index);
            }
            index = url.lastIndexOf(".");
            if (index == -1)
            {
                return null;
            }
            url = url.slice((index + 1), url.length);
			var typeDeclaration:AssetTypeDeclaration;
            for (var type:String in this._localListOfTypesByMime)
            {
                typeDeclaration = this._localListOfTypesByMime[type];
                fileTypes = typeDeclaration.fileTypes;
                if (fileTypes != null)
                {
                    if (fileTypes.indexOf(url, 0) > -1)
                    {
                        return typeDeclaration;
                    }
                }
            }
            for (type in _sharedListOfTypesByMime)
            {
                typeDeclaration = _sharedListOfTypesByMime[type];
                fileTypes = typeDeclaration.fileTypes;
                if (fileTypes != null)
                {
                    if (fileTypes.indexOf(url, 0) > -1)
                    {
                        return typeDeclaration;
                    }
                }
            }
            return null;
        }

        private function fetchAssetFromResource(name:String):IAsset
        {
            var _local_8:uint;
            if (!this._resource)
            {
                return null;
            }
            var manifest:XMLList = this._manifest.child(LIB);
            if (manifest == null)
            {
               Habbo.trackLoginStep("Asset Library: Provided manifest doesn't contain library node!");
               throw (new Error("Provided manifest doesn't contain library node!"));
            }
            if (manifest.length() == 0)
            {
                return null;
            }
            manifest = manifest[0].assets;
            if (manifest != null)
            {
                manifest = manifest.child(ASSET);
                if (manifest != null)
                {
                    for (var i:int; i < manifest.length(); i++)
                    {
                        
            			var xml:XML = manifest[_local_8];
                        if (((xml.attribute(NAME)) && (xml.attribute(NAME).toString() == name)))
                        {
                            var typeDeclaration:AssetTypeDeclaration = this.getAssetTypeDeclarationByMimeType(xml.attribute(TYPE));
                            if (typeDeclaration == null)
                            {
								Habbo.trackLoginStep("Asset Library: Failed to extract asset " + name + " from Library " + this._file + "!");
                                throw (new Error((((("Failed to extract asset " + name) + " from Library ") + this._file) + "!")));
                            }
                            var asset:IAsset = (new (typeDeclaration.assetClass)(typeDeclaration) as IAsset);
                            asset.setUnknownContent(this._resource[name]);
                            var childNodes:XMLList = xml.child(PARAM);
                            if (((childNodes) && (childNodes.length())))
                            {
                                asset.setParamsDesc(childNodes);
                            }
                            this.setAsset(name, asset);
                            return asset;
                        }
                    }
                }
            }
            return null;
        }

        public function toString():String
        {
            return (getQualifiedClassName(this) + ": ") + this._name;
        }
    }
}
