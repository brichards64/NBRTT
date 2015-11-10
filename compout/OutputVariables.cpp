#include <stdio.h>     
#include <stdlib.h>    

void OutputVariables(char *filename=NULL) {
  /* A simple script to plot aspects of phototube hits 
   * This code is rather cavalier; I should be checking return values, etc.
`   * First revision 6-24-10 David Webber
   * 
   * I like to run this macro as 
   * $ root -l -x 'read_PMT.C("../wcsim.root")'
   */

  TTree tree("test","test");

  int ntubeshit=0;
  int ncherenkovhits=0;

  tree.Branch("ntubeshit",&ntubeshit,"ntubeshit/I");
  tree.Branch("ncherenkovhits",&ncherenkovhits,"ncherenkovhits/I");

  gROOT->Reset();
  char* wcsimdirenv;
  wcsimdirenv = getenv ("WCSIMDIR");
  if(wcsimdirenv !=  NULL){
    gSystem->Load("${WCSIMDIR}/libWCSimRoot.so");
  }else{
    gSystem->Load("../libWCSimRoot.so");
  }
  gStyle->SetOptStat(1);

  TFile *f;
  if (filename==NULL){
    f = new TFile("../wcsim.root");
  }else{
    f = new TFile(filename);
  }
  if (!f->IsOpen()){
    cout << "Error, could not open input file: " << filename << endl;
    return -1;
  }

  TTree  *wcsimT = f->Get("wcsimT");

  WCSimRootEvent *wcsimrootsuperevent = new WCSimRootEvent();
  wcsimT->SetBranchAddress("wcsimrootevent",&wcsimrootsuperevent);

  // Force deletion to prevent memory leak when issuing multiple
  // calls to GetEvent()
  wcsimT->GetBranch("wcsimrootevent")->SetAutoDelete(kTRUE);

  for(int event;event<wcsimT->GetEntriesFast();event++){

    wcsimT->GetEvent(event); 
    
    // In the default vis.mac, only one event is run.  I suspect you could loop over more events, if they existed.
    WCSimRootTrigger *wcsimrootevent = wcsimrootsuperevent->GetTrigger(0);
    
    //--------------------------
    // As you can see, there are lots of ways to get the number of hits.
    ntubeshit=wcsimrootevent->GetNumTubesHit();
    ncherenkovhits=wcsimrootevent->GetNcherenkovhits();
      
    tree.Fill();
  }

  TFile outfile("testvars.root","RECREATE");
  tree.Write();
  outfile.Close();


}
