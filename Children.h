//
//  Children.h
//  TestDatabase
//
//  Created by Test on 10/18/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Children : NSObject

+(BOOL) PhysicianExistwithID:(NSString *)pID;

+(NSString *)GetPhysicianNameByID:(NSString *)pID;

+ (NSMutableArray *) Search: (NSMutableDictionary *) searchInfo;

+(NSMutableArray *) GetChildInfomation:(NSString *)childID;

+(NSMutableArray *) GetChildRecord:(NSString *) childID ageRange: (NSString *) ageRange;

+(NSMutableArray *) GetDetailRecordByRecordID:(NSString *) recordID childID:(NSString *)childID growPeriod: (NSString *)growthPeriod;

+(NSString *) GetNoteByChildID: (NSString *) childID;

+(NSString *) EditChildInformation:(NSString *) tableName childID:(NSString *) childID ageRange:(NSString *) ageRange recordID:(NSString *) recordID newInfo: (NSMutableDictionary *) newInfo;

+(NSString *) CreateNewChildInformation:(NSString *) tableName newData:(NSMutableArray *) newData;

+(void) DeleteChildInfo:(NSString *) tableName id:(NSString*)identifier;

+(NSString *) AddNewRecordByChildrenID:(NSString *) childID andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andAgeRange:(NSString *) ageRange;

+(NSString *)EditRecordByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andTakenDate:(NSString *)takenDate andTaken:(NSString *)taken andPhysician:(NSString *)pID;

+(NSMutableArray *) GetChildRecordByChildID:(NSString *) childID ageRange: (NSString *) ageRange;

+(NSString *) AddNoteByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange;

+(NSString *) EditNoteByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange andNewNote:(NSString *)note;

+(NSString *) GetNoteByChildID:(NSString *)childID andAgeRange:(NSString *)ageRange;

+(NSMutableArray *)GetRecordIDForAdditionalVaccineByChildrenID:(NSString *)childID;

+(void)EditRecordForAdditionalVaccineByRecordID: (NSString *)recordID andChildrenID:(NSString *)childID andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andTakenDate:(NSString *)takenDate andTaken:(NSString *)taken andPhysician:(NSString *)pID;

+(NSMutableArray *)GetAdditionalRecordByChildID:(NSString *)childID;

+(NSString *)GetPhysicianClinicByPhysicianID:(NSString *)pID;

+(void)UpdateReturnDateByChildrenID:(NSString*)childID andReturnDate:(NSString *)returnedDate;

+(void)AddGrowthByChildID:(NSString *)cID;

+(NSMutableArray *) GETGrowthByChildID:(NSString*) cID;

+(void)UPdateGrowthByChildrenID:(NSString *)cID andAgeRange:(NSString *)ageRange andHeight:(NSString *)height andWeight:(NSString *)weight andHeadSize:(NSString *)headSize;

@end
