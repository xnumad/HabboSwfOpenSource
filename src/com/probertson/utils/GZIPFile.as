package com.probertson.utils
{
    import flash.utils.ByteArray;

    public class GZIPFile 
    {
        private var _gzipFileName:String;
		private var _compressedData:ByteArray;
		private var _headerFileName:String;
		private var _headerComment:String;
		private var _fileModificationTime:Date;
		private var _originalFileSize:uint;

        public function GZIPFile(compressedData:ByteArray, 
									originalFileSize:uint, 
									fileModificationTime:Date, 
									gzipFileName:String="", 
									headerFileName:String=null,
									headerComment:String=null)
		{
			_compressedData = compressedData;
			_originalFileSize = originalFileSize;
			_fileModificationTime = fileModificationTime;
			_gzipFileName = gzipFileName;
			_headerFileName = headerFileName;
			_headerComment = headerComment;
		}
		
		
		// ------- Public properties -------
		public function get gzipFileName():String
		{
			return _gzipFileName;
		}
		
		
		public function get headerFileName():String
		{
			return _headerFileName;
		}
		
		
		public function get headerComment():String
		{
			return _headerComment;
		}
		
		
		public function get fileModificationTime():Date
		{
			return _fileModificationTime;
		}
		
		
		public function get originalFileSize():uint
		{
			return _originalFileSize;
		}
		
		
		// ------- Public methods -------
		/**
		 * Retrieves a copy of the compressed data bytes extracted from the GZIP file.
		 * Modifications to the result ByteArray, including uncompressing, do not
		 * alter the result of future calls to this method.
		 * 
		 * @returns	A copy of the compressed data bytes contained in the ByteArray.
		 * 			Call the <code>ByteArray.inflate()</code> method on the result
		 * 			for the uncompressed data.
		 * 
		 * @see flash.data.ByteArray#inflate()
		 */
		public function getCompressedData():ByteArray
		{
			var result:ByteArray = new ByteArray();
			_compressedData.position = 0;
			_compressedData.readBytes(result, 0, _compressedData.length);
			return result;
		}
    }
}
