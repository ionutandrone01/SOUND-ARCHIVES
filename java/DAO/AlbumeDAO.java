package DAO;

import java.util.List;
import pojo.Albume;

public interface AlbumeDAO {
    public void adaugaAlbum(Albume album);
    public List<Albume> afiseazaAlbum();
    public void modificaAlbum(long idalbum, String nume, String tip);
    public void stergeAlbum(Albume album);
}