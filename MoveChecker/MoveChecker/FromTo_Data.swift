//
//  FromTo_Data.swift
//  MoveChecker
//
//  Created by 寺内 信夫 on 2016/09/17.
//  Copyright © 2016年 寺内 信夫. All rights reserved.
//

import Foundation

class FromTo_Data_ {
	
	/*var str_Type = ""
	var str_Name = "", str_F_FullName = "", str_T_FullName = ""
	
	var int_F_Length = 0, int_T_Length = 0
	
	var bool_To_Flag = false, bool_CopyEnd = false, bool_DeleteEnd = false
	
	//var ft_Datas : [FromTo_Data] = [ ]
	var ft_Datas : [AnyObject?] = [ ] // [FromTo_Data] = [ ]//{ }// [FromTo_Data]
	
	//private CancellationTokenSource cts_Cancel = null;
	
	let fileManager: FileManager = FileManager.default
	
	
	func FromTo_Data(_ is_dir: Bool, str_name: String, str_f_full: String, str_t_full: String/*,
		CancellationTokenSource _cts*/) {
		
		str_Name = str_name
		
		str_F_FullName = str_f_full
		str_T_FullName = str_t_full
		
		if (is_dir) {
			str_Type = "Dir"
			
			int_F_Length = 0
			int_T_Length = 0
		} else {
			str_Type = "File"
			
			do {
				let attr: NSDictionary = try fileManager.attributesOfItem(atPath: str_f_full) as NSDictionary
				let str = attr.fileSize()
				int_F_Length = Int(str)
				
				var isDir : ObjCBool = true
				if (fileManager.fileExists(atPath: str_T_FullName, isDirectory:&isDir) == false) {
					let attr: NSDictionary = try fileManager.attributesOfItem(atPath: str_f_full) as NSDictionary
					let str = attr.fileSize()
					int_T_Length = Int(str)
				}
			}
			catch {
				
			}
		}
		
		//cts_Cancel = _cts;
	}
	
	func CheckDirectory(
		_ dic_FT: [String : AnyObject]/*, dic_Flag: [FromTo_Data : FT_Flag],*/
		/*_ int_f_sumisize: inout Int,  int_t_sumisize: inout Int, int_f_filesize: inout Int, int_t_filesize: inout Int*/) {
		
		//var token = cts_Cancel.Token;
		
		///ft_Datas = [FromTo_Data]
		
		
		var isDir : ObjCBool = true
		
		//do {
			let list_f = try? fileManager.contentsOfDirectory(atPath: str_F_FullName)
			
			list_f?.forEach {
				
				let c_f_path = $0
				
				let f_list = c_f_path.components(separatedBy: "/")
				var name = f_list[f_list.count - 1]
				
				isDir = false
				
				if fileManager.fileExists(atPath: name, isDirectory:&isDir) {
					
					var ft_data: FromTo_Data? = FromTo_Data(false,
					                          str_name: name,
					                          str_f_full: c_f_path,
					                          str_t_full: str_T_FullName + "/" + name)
					
					if let ft_d = ft_data {
						
						/*if (token.IsCancellationRequested)
						{
						return;
						}*/
						
						ft_data.CheckFile(
							dic_FT: dic_FT/*, dic_Flag,*/
							/*int_f_sumisize: &int_f_sumisize, int_t_sumisize: &int_t_sumisize,
							int_f_filesize: &int_f_filesize, int_t_filesize: &int_t_filesize*/)
						
						ft_Datas.append(ft_data)
						
						/*if (token.IsCancellationRequested)
						{
						return;
						}*/
					}
					
				}
				
			}
			
			list_f?.forEach {
				
				let c_d_path = $0
				
				var d_list = c_d_path.components(separatedBy: "/")
				var name = d_list[d_list.count - 1]
				
				isDir = true
				
				if fileManager.fileExists(atPath: name, isDirectory:&isDir) {
					
					let ft_data: FromTo_Data? = FromTo_Data(true,
					                          str_name: name,
					                          str_f_full: c_d_path,
					                          str_t_full: str_T_FullName + "/" + name/*, cts_Cancel*/)
					
					if let ft_d = ft_data {

						/*if (token.IsCancellationRequested)
						{
							return;
						}*/
					
						ft_d.CheckDirectory(
							dic_FT/*, dic_Flag,*/
							/*&int_f_sumisize, &int_t_sumisize, &int_f_filesize, &int_t_filesize*/)
					
						ft_Datas.append(ft_d)
					
					}
					
					/*if (token.IsCancellationRequested)
					{
					return;
					}*/
				}
				
				isDir = true
				
				if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) {
					bool_CopyEnd = true;
				}
				
				//dic_FT.Add(str_F_FullName, this);
			/*}
			catch {
				
			}*/
			
		}
		
		func CheckFile(
			_ dic_FT: [String : AnyObject]/*, Dictionary<FromTo_Data, FT_Flag> dic_Flag,*/
			/*_ int_f_sumisize: inout Int, int_t_sumisize: inout Int, int_f_filesize: inout Int, int_t_filesize: inout Int*/) {
			
			//int_f_sumisize += int_F_Length
			//int_f_filesize += 1
			FromTo_C.int_F_SumiSize += int_F_Length
			FromTo_C.int_T_FileSize += 1
			
			var isDir : ObjCBool = false
			
			if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) {
				
				if FileCompare(str_F_FullName, file_name2: str_T_FullName) {
					
					bool_CopyEnd = true
					
					//int_t_sumisize += int_T_Length
					//int_t_filesize += 1
					FromTo_C.int_T_SumiSize += int_T_Length
					FromTo_C.int_T_FileSize += 1
					
				} else {
					
					int_T_Length = 0
					
				}
				
			}
			
			//dic_AB.Add(str_F_FullName, this);
		}
		
		func Copy(/*_ int_length: inout Int, int_files: inout Int*/) {
			
			//var token = cts_Cancel.Token;
			
			var isDir : ObjCBool = false
			
			loop:
				
				/*if (token.IsCancellationRequested) {
				return;
				}*/
				
			switch (str_Type) {
				
			case "Dir":
				
				isDir = true
				
				if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) == false {
					
					do {
						
						try fileManager.createDirectory(atPath: str_T_FullName, withIntermediateDirectories: false, attributes: nil)
						
					} catch {
						
						break loop
						
					}
					
				}
				
				/*if (token.IsCancellationRequested) {
				return;
				}*/
				
				//ft_Datas.forEach {
			
				//	if let ft_data: FromTo_Data = $0 as? FromTo_Data {
				for ft_data: FromTo_Data in ft_Datas {

					ft_data.Copy(/*&int_length, &int_files*/)
						
					
					/*if (token.IsCancellationRequested) {
					return;
					}*/
					
				}
				
				break;
				
			case "File":
				
				if bool_CopyEnd == false {
					
					isDir = false
					
					if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) == false {
						
						FileCopy()
						
						break loop
						
					} else {
						
						if int_F_Length == int_T_Length {
							
							if FileCompare(str_F_FullName, file_name2: str_T_FullName) == false {
								
								FileCopy()
								
								break loop
								
							} else {
								
								bool_CopyEnd = true
								
								//int_length += int_T_Length
								//int_files  += 1
								FromTo_C.int_T_SumiSize += int_T_Length
								FromTo_C.int_T_FileSize += 1
							
							}
							
						} else {
							
							FileCopy()
							
							break loop
							
						}
						
					}
					
				}
				
				break;
				
			}
			
		}
		
		func FileCopy() {
			
			var isDir : ObjCBool = false
			
			do {
				
				if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) {
					
					try fileManager.removeItem(atPath: str_T_FullName)
					
				}
				
				try fileManager.copyItem(atPath: str_F_FullName, toPath: str_T_FullName)
				
				if fileManager.fileExists(atPath: str_T_FullName, isDirectory: &isDir) {
					
					let attr: NSDictionary = try fileManager.attributesOfItem(atPath: str_T_FullName) as NSDictionary
					let str = attr.fileSize()
					
					int_T_Length = Int(str)
					
				}
				
			}
			catch {
				
			}
			
		}
		
		func Delete() {
			
			//var token = cts_Cancel.Token;
			
			do {
				
				var isDir : ObjCBool = false
				
				loop:
					
					/*if (token.IsCancellationRequested) {
					return;
					}*/
					
				switch (str_Type) {
					
				case "File":
					
					if bool_DeleteEnd == false {
						
						isDir = false
						
						if fileManager.fileExists(atPath: str_F_FullName, isDirectory: &isDir) {
							
							try fileManager.removeItem(atPath: str_F_FullName)
							
							if fileManager.fileExists(atPath: str_F_FullName, isDirectory: &isDir) {
								
								break loop
								
							}
							
						}
						
						bool_DeleteEnd = true;
						
					}
					
					break;
					
				case "Dir":
					
					//ft_Datas.forEach() {
					for ft_data_: FromTo_Data? in ft_Datas {
						//let ft_data: FromTo_Data? = $0 as FromTo_Data
							
						if let ft_d = ft_data {
							
							ft_data.Delete()
							
						}
						
					}
					
					isDir = true
					
					if fileManager.fileExists(atPath: str_F_FullName, isDirectory: &isDir) {
						
						try fileManager.removeItem(atPath: str_F_FullName)
						
						if fileManager.fileExists(atPath: str_F_FullName, isDirectory: &isDir) {
							
							break loop
							
						}
						
					}
					
					bool_DeleteEnd = true
					
					break
					
				}
				
			}
			catch{
				
			}
			
		}
		
		func FileCompare(_ file_name1: String, file_name2: String) -> Bool {
			
			let data1 = try? Data(contentsOf: URL(fileURLWithPath: file_name1))
			let data2 = try? Data(contentsOf: URL(fileURLWithPath: file_name2))
			
			if data1! == data2! {
				
				return true
				
			}
			
			return false
			
		}
		
		func SetFilesSize(_ str_d_fullname: String) -> Int {
			
			var size = 0
			
			isDir = true
			
			//do {
			
			if fileManager.fileExists(atPath: str_d_fullname, isDirectory: &isDir) {
				
				if let list = try? fileManager.contentsOfDirectory(atPath: str_d_fullname) {
					
					try? list.forEach {
						
						let name = $0
						
						isDir = false
						
						if fileManager.fileExists(atPath: name, isDirectory: &isDir) {
							
							let attr: NSDictionary = try fileManager.attributesOfItem(atPath: name) as NSDictionary
							let str = attr.fileSize()
							
							size += Int(str)
							
						}
						else {
							
							size += SetFilesSize(name)
							
						}
						
					}
					
				}
				
			}
			
			return size
			
			/*}
			catch {
			
			return 0
			
			}*/
			
		}
		
	}

}

	/*class  a {
		
		var aa: [a]
		
		func a() {
			
		}
		
		func b() {
			
			aa.Add(a())
			
		}
		
}*/
