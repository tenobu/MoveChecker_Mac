//
//  FromTo_C.swift
//  MoveChecker
//
//  Created by 寺内 信夫 on 2016/08/19.
//  Copyright © 2016年 寺内 信夫. All rights reserved.
//

import Foundation

class FromTo_C {

	var str_Name = "", str_Status = "", str_Error = ""

	var bool_EndFlag = false
			
	static var int_F_SumiSize = 0, int_T_SumiSize = 0, int_F_FileSize = 0, int_T_FileSize = 0
			
	//public var ft_Data : FromTo_Data
	
	//public var dic_FT : [String, FromTo_Data]
	
	//public Dictionary<FromTo_Data, FT_Flag> dic_Flag = null;
			
	var bool_WaitFlag = false
			
	//private CancellationTokenSource cts_Cancel = null;
			
	let fileManager: FileManager = FileManager.default

	
	func FromTo_C(_ f_path: String, b_base_path: String) {
	
		bool_WaitFlag = true
			
		str_Status = "Normal"

		var isDir : ObjCBool = true
		if (fileManager.fileExists(atPath: f_path, isDirectory:&isDir) == false) {
			str_Error = "From がディレクトリで無い！！"
			str_Status = "Abend"
			bool_WaitFlag = false
		
			return
		}
			
		///var di_a = new DirectoryInfo(f_path);
			
		if (fileManager.fileExists(atPath: b_base_path, isDirectory:&isDir) == false) {
			str_Error = "ToBase がディレクトリで無い！！"
			str_Status = "Abend"
			bool_WaitFlag = false
			
			return
		}
		
		let f_list = f_path.components(separatedBy: "/")
		var t_path = ""
		if f_list.count > 0 {
			t_path = b_base_path + "/" + f_list[f_list.count - 1]
		}
		
		//var di_b = new DirectoryInfo((b_base_path + @"\" + di_a.Name).Replace(@"\\", @"\"));
		
		//dic_FT   = new Dictionary<string , FromTo_Data>();
		//dic_Flag = new Dictionary<FromTo_Data, FT_Flag>();
			
		str_Name = f_list[f_list.count - 1]
			
		//cts_Cancel = new CancellationTokenSource();
			
		/*
		ft_Data = FromTo_Data()
		
		ft_Data.DataMove(
			true,
		                      str_name: di_a.Name,
		                      str_f_full: di_a.FullName,
		                      str_t_full: di_b.FullName/*, cts_Cancel*/);
		*/
	}
/*
		public void Check()
		{
			bool_WaitFlag = true;
			
			str_Status = "Normal";
			
			var end_flag = true;
			long_F_SumiSize = long_T_SumiSize = 0L;
			
			var token = cts_Cancel.Token;
			
			Task.Factory.StartNew(() => {
				
				try
					{
						ft_Data.CheckDirectory(
							dic_FT, dic_Flag,
							ref long_F_SumiSize, ref long_T_SumiSize,
							ref long_F_FileSize, ref long_T_FileSize);
						
						if (token.IsCancellationRequested)
						{
							str_Error  = "Error Cancelされました！！";
							str_Status = "Abend";
							
							return;
						}
						
						foreach (var ab in dic_FT.Values)
						{
							if (end_flag && ab.bool_CopyEnd == false) end_flag = false;
							
							if (token.IsCancellationRequested)
							{
								str_Error  = "Error Cancelされました！！";
								str_Status = "Abend";
								
								return;
							}
						}
						
						bool_EndFlag = end_flag;
						
						Console.WriteLine("End = " + bool_EndFlag);
				}
				catch(Exception e)
				{
					str_Error  = "Error From " + e.Message;
					str_Status = "Abend";
				}
				finally
					{
						bool_WaitFlag = false;
				}
				
				});
		}
		
		
		public void Copy()
		{
			bool_WaitFlag = true;
			
			str_Status = "Normal";
			
			var token = cts_Cancel.Token;
			
			Task.Factory.StartNew(() =>
				{
					
					try
						{
							var end_flag = true;
							
							ft_Data.Copy(ref long_T_SumiSize, ref long_T_FileSize);
							
							if (token.IsCancellationRequested)
							{
								str_Error  = "Error Cancelされました！！";
								str_Status = "Abend";
								
								return;
							}
							
							if (end_flag) bool_EndFlag = true;
							
							bool_EndFlag = end_flag;
							
							Console.WriteLine("End = " + bool_EndFlag);
					}
					catch (Exception e)
					{
						str_Error = "Error To " + e.Message;
						str_Status = "Abend";
					}
					finally
						{
							bool_WaitFlag = false;
					}
					
				});
		}
		
		public void Delete()
		{
			bool_WaitFlag = true;
			
			str_Status = "Normal";
			
			var token = cts_Cancel.Token;
			
			Task.Factory.StartNew(() =>
				{
					
					try
						{
							var end_flag = true;
							long_F_SumiSize = 0L;
							
							ft_Data.Delete();
							
							if (token.IsCancellationRequested)
							{
								return;
							}
							
							foreach (var ab in dic_FT.Values)
							{
								if (end_flag && ab.bool_DeleteEnd == false) end_flag = false;
								
								if (ab.str_Type.Equals("Dir"))
								{
									if (Directory.Exists(ab.str_F_FullName) == true)
									{
										if (end_flag && ab.bool_DeleteEnd == false) end_flag = false;
									}
								}
								else if (
									ab.str_Type.Equals("File"))
								{
									if (File.Exists(ab.str_F_FullName) == true)
									{
										if (end_flag && ab.bool_DeleteEnd == false) end_flag = false;
										
										long_F_SumiSize += ab.long_F_Length;
									}
								}
								
								if (token.IsCancellationRequested)
								{
									return;
								}
							}
							
							bool_EndFlag = end_flag;
							
							if (end_flag) bool_EndFlag = true;
							
							Console.WriteLine("End = " + bool_EndFlag);
					}
					catch (Exception e)
					{
						str_Error = "Error From " + e.Message;
						str_Status = "Abend";
					}
					finally
						{
							bool_WaitFlag = false;
					}
					
				});
		}
		
		public void Cancel()
		{
			cts_Cancel.Cancel();
		}*/
}
