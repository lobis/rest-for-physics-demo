void GDML2ROOT(const TString &gdml_filename)
{
    auto geo = TGeoManager::Import(gdml_filename);

    auto file = new TFile(gdml_filename + ".root", "RECREATE");

    geo->Write("Geometry");

    file->Close();
}

// root -q """GDML2ROOT.C(\"../../simulations/geometries/layered-cylinder/geometry.gdml\")"""